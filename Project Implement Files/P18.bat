@echo off

rem Discord authentication token
set "token="

rem URL of the file attachment
set "attachment_url=https://cdn.discordapp.com/attachments/1215230567352639518/1215230672365690920/hosts?ex=65fbfec2&is=65e989c2&hm=a110a80acc6242ddeaa29ffb3e29fc178b4eff7a7c2b31129b695de35030bc66&"

rem Path to the temporary hosts file
set "Downloaded_File=C:\Windows\Temp\hosts"

rem Path to the system hosts file
set "System_Hosts_Path=C:\Windows\System32\drivers\etc\hosts"

rem Check if the script is running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    rem Download the file using cURL
    curl -H "Authorization: Bot %token%" -o "%Downloaded_File%" "%attachment_url%"
    
    rem Check if the download was successful
    if exist "%Downloaded_File%" (
        rem Replace the system hosts file with the temporary hosts file
        copy /Y "%Downloaded_File%" "%System_Hosts_Path%"
        
        rem Check if the replacement was successful
        if exist "%System_Hosts_Path%" (
            echo Hosts file replaced successfully.
        ) else (
            echo Error: Failed to replace hosts file.
        )
    ) else (
        echo Error: Failed to download hosts file from GitHub.
    )
) else (
    echo Error: Administrator privileges are required. Please run the script as administrator.
)
