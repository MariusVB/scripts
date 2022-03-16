

function charconvert
    gzip -c $argv[1] > index

    /home/marius/Documents/packages/FileToArray/filetoarray index > compressed_$argv[1].h

    rm index

end

function gclone
    git clone $argv[1]
end

function dup
    docker compose up -d $argv
end

function ddown
    docker compose down
end

function ddup
    docker compose -f docker-compose.dev.yml up -d $argv
end

function dnuke
    docker rm -f (docker ps -a -q)
    docker container prune -f
    docker volume prune -f
end

function gits
    git status
end

function cat
    bat $argv
end

function gitc
    git add .
    git commit -m $argv
    git push
end

function gitp
    git pull --ff-only
end

function ls
   exa --icons
end

function ll
   exa -la --icons
end

function ngrok
    /usr/bin/ngrok http $argv --region eu
end

function clip
    $argv | xclip -sel clip
end

function dlogs
    docker logs -f $argv
end

function pdfshrink
    set out (echo "$argv" | string replace '.pdf' '')-compressed.pdf
    ps2pdf -dPDFSETTINGS=/ebook $argv $out
end