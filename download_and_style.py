import os
import requests
from bs4 import BeautifulSoup

base_url = 'https://danluu.com/'
link_to_css = '<link rel="stylesheet" href="/styles.css">'


def fix_hyperlinks(string):
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

    # Create a directory to store the downloaded posts
    os.makedirs('downloaded_posts', exist_ok=True)

    for post_link in post_links:
        post_url = base_url + post_link.get('href').rstrip('/').split('/')[-1]

        # Send an HTTP GET request to fetch the post
        post_response = requests.get(post_url)
        if post_response.status_code == 200:
            post_str = post_response.content.decode()
            start = post_str.find("<style>")
            end = post_str.find("</style>")
            new_post_str = post_str[:start] + link_to_css + post_str[end:]
            new_post_str = fix_hyperlinks(new_post_str)
            # Save then modified HTML to a file
            post_title = post_link.get_text()
            with open(f'{post_title}.html', 'w', encoding='utf-8') as file:
                file.write(new_post_str)
            print(f'Styled HTML saved for post: {post_title}')
        else:
            print(f'Failed to fetch the post: {post_url}')
else:
    print('Failed to fetch the homepage')
