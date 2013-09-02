### All my posts, those who are created by Markdown editor.
### You can use [pelican](https://github.com/getpelican/pelican) to generate a static site from the posts.
-------------

### install
Assume you have install [pelican](https://github.com/getpelican/pelican).  
first:

    git clone git@github.com:zxkletters/my-posts.git my-posts

second: 

    cd my-posts
    make html

then you will find all static *html*, *css*, *js* files in gh_pages folder.


you alse can try:

    make github  # generate static files into gh_pages folder, in which folder you can init your gh_pages in github
    or
    make publish # generate static files into output folder
    
the differences of commands: *make html* , *make github* and *make publish* are:  
*make html* use pelicanconf.py as settings
*make github* use githubconf.py as settings
*make publish* use publishconf.py as settings
