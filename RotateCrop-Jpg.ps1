#  Install-Module ImagePlayGround -Force -Verbose
$rotation = 1
$rect = [SixLabors.ImageSharp.Rectangle]::new(150,525,2290,3240)
$ogPath = "C:\Users\praty\OneDrive\Documents\PropDocs\Gaursons\16th ParkVw O-15115\Possession\OrgPics"
$ogFolder = "OrgPics"
$destFolder = "Fixed"
$files = $(gci $ogPath -Filter *.jpg).FullName
$files | %{
	 $image = Get-Image -FilePath $_
	 $image.Rotate($rotation)
	 $image.Crop($rect)
	 $newPath = $_.Replace($ogFolder, $destFolder)
	 Save-Image -Image $image -FilePath $newPath
}
