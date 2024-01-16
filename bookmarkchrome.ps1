# Define the bookmarks with their names
$bookmarks = @{
    "dotnet apps" = "https://fwdays.com/en/event/dotnet-fwdays-2020/review/securing-dotnet-apps-and-microservices-in-azure"
    "stackoverflow" = "https://stackoverflow.com/questions/54428054/how-to-secure-azure-serverless-microservice-architecture"
    "github" = "https://github.com/iambrotherfranklyn/housekeeping/blob/main/tool-installations.ps1"
}

# Create a new directory for the HTML file
$directoryPath = "C:\Users\$env:USERNAME\Documents\Bookmarks"
New-Item -Path $directoryPath -ItemType Directory -Force

# Create a new HTML file
$htmlFilePath = "$directoryPath\bookmarks.html"
New-Item -Path $htmlFilePath -ItemType File -Force

# Write the HTML header to the file
Add-Content -Path $htmlFilePath -Value "<!DOCTYPE NETSCAPE-Bookmark-file-1>"
Add-Content -Path $htmlFilePath -Value "<META HTTP-EQUIV=`"Content-Type`" CONTENT=`"text/html; charset=UTF-8`">"
Add-Content -Path $htmlFilePath -Value "<Title>Bookmarks</Title>"
Add-Content -Path $htmlFilePath -Value "<H1>Bookmarks</H1>"
Add-Content -Path $htmlFilePath -Value "<DL><p>"

# Write each bookmark to the file
foreach ($name in $bookmarks.Keys) {
    $bookmark = $bookmarks[$name]
    Add-Content -Path $htmlFilePath -Value "`t<DT><A HREF=`"$bookmark`">$name</A>"
}

# Write the HTML footer to the file
Add-Content -Path $htmlFilePath -Value "</DL><p>"
