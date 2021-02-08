New-Item -Force -Path .\definitions.oajs
Get-ChildItem scripts -Recurse *.oajs | ForEach {
	$path = $($_.Directory.Name)
	if ($path -eq "definitions") {
		if ($path -ne "scripts") {
			$path = "scripts/$($_.Directory.Name)"
		}
		$variable = "//#include $path/$($_.Name)"
		Add-Content -Value $variable -Path .\definitions.oajs
	}
}