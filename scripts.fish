function wg-up
  sudo systemctl start wg-quick@wg0
end

function wg-down
  sudo systemctl stop wg-quick@wg0
end

function nmc
    if not set -q argv[2]
        nmcli d w c $argv[1]
    else
        nmcli d w c $argv[1] password $argv[2]
    end
end

function nml
  nmcli d w l
end


function charconvert
    gzip -c $argv[1] > index

    ~/Documents/packages/FileToArray/filetoarray index > compressed_$argv[1].h

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
    git commit -m $argv
    git push
end

function gitp
    git pull --ff-only
end

function gp
    git push
end

function edit-fish
    code ~/Documents/scripts/scripts.fish
    code ~/.config/fish/config.fish
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
