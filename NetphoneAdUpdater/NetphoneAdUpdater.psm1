& "$($PSScriptRoot)\Set-Variables.ps1"

#Get public and private function definition files.
    $Public  = @( Get-ChildItem -Path $NetphoneUpdaterFolder\Public\*.ps1 -ErrorAction SilentlyContinue -Recurse)
    $Private = @( Get-ChildItem -Path $NetphoneUpdaterFolder\Private\*.ps1 -ErrorAction SilentlyContinue -Recurse)

#Dot source the files
    Foreach($import in @($Public + $Private))
    {
        Try
        {
            . $import.fullname
        }
        Catch
        {
            Write-Error -Message "Failed to import function $($import.fullname): $_"
        }
    }

# Here I might...
    # Read in or create an initial config file and variable
    # Export Public functions ($Public.BaseName) for WIP modules
    # Set variables visible to the module and its functions only

if($debug)
{
    Export-ModuleMember -Function @($Public + $Private).Basename
}
else
{
    Export-ModuleMember -Function $Public.Basename
}