@echo off

rem Discord authentication token
set "token="

rem URL of the file attachment
set "attachment_url=https://cdn.discordapp.com/attachments/1215230567352639518/1215230672365690920/hosts?ex=6617ae42&is=66053942&hm=dee589f1e8ec08c3c829dc4f6a02a1900a8a26bbef861db1e117fb283e4cbbab&"


rem Path to save the downloaded file
set "downloaded_file=file_name.txt"

rem Download the file using cURL
curl -H "Authorization: Bot %token%" -o "%downloaded_file%" "%attachment_url%"

rem Check if the download was successful
if exist "%downloaded_file%" (
    echo File downloaded successfully.
) else (
    echo Error: Failed to download file.
)

