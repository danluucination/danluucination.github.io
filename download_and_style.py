import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse, urljoin


base_url = 'https://danluu.com/'
link_to_css = '<link rel="stylesheet" href="/styles.css">'


def fix_hyperlinks(string):
    # the last line is a quick hack to avoid href ending in /
    # url ending in / don't redirect correctly to .html
    return string.replace(base_url, '')


# Send an HTTP GET request to fetch the homepage
response = requests.get(base_url)
index_str = response.content.decode()
index_str += link_to_css
index_str = fix_hyperlinks(index_str)
with open("index.html", "w") as file:
    file.write(index_str)

if response.status_code == 200:
    # Parse the homepage HTML content using BeautifulSoup
    homepage_soup = BeautifulSoup(response.content, 'html.parser')

    # Find all the links to individual posts
    post_links = homepage_soup.find_all('a')

    for post_link in post_links:
        post_name = post_link.get('href').rstrip('/').split('/')[-1]
        post_url = base_url + post_name

        # Send an HTTP GET request to fetch the post
        post_response = requests.get(post_url)
        if post_response.status_code == 200:
            os.makedirs(post_name, exist_ok=True)

            post_str = post_response.content.decode()
            start = post_str.find("<style>")
            end = post_str.find("</style>")
            new_post_str = post_str[:start] + link_to_css + post_str[end:]
            new_post_str = fix_hyperlinks(new_post_str)
     
            # Find and donwload image
            post_soup = BeautifulSoup(new_post_str, 'html.parser')
            # Find all image tags and download images
            img_tags = post_soup.find_all('img')
            if img_tags:
                os.makedirs(f"images/{post_name}", exist_ok=True)
            for img_tag in img_tags:
                img_url = img_tag.get('src')
                if img_url:
                    img_url = urljoin(base_url, img_url)
                    img_response = requests.get(img_url)
                    if img_response.status_code == 200:
                        img_filename = os.path.join(f"images/{post_name}", os.path.basename(urlparse(img_url).path))
                        with open(img_filename, 'wb') as img_file:
                            img_file.write(img_response.content)
                        img_tag['src'] = img_filename

            # Save then modified HTML to a file
            with open(f"{post_name}/index.html", 'w', encoding='utf-8') as file:
                file.write(new_post_str)
            print(f'Styled HTML saved for post: {post_name}')
        else:
            print(f'Failed to fetch the post: {post_url}')
else:
    print('Failed to fetch the homepage')
