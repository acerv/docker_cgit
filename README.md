# Install

Build the container:

    docker build -t cgit .
    docker run -d -p 80:80 cgit 

Then connect to `http://localhost/cgit`.

# CGit configuration

CGit gets repositories from the `/srv/git` directory. Copy there your git repos.
In order to make them visible on browser, upload a new `/etc/cgitrc` file.
    
