function Get-CompanyNumber
{
    Param(
    [parameter(Mandatory)]
    $NetphoneUser
    )

    #Get the Trunk containing the public number of the user
    $Trunk = Get-PublicNumberTrunkFromUser($NetphoneUser)

    #Step through every number in the Tailnumber until Tailstart and Tailend are different
    for($counter = 0; $counter -le $Trunk.TailNumberStart.Length -1 ; $counter++)
    {
        #if the number at the position is different, strip of the number part thats different
        if($Trunk.TailNumberStart[$counter] -ne $Trunk.TailNumberEnd[$counter])
        {
            return $Trunk.TailNumberStart.substring($counter)
        }
    }

    <#
        .SYNOPSIS
        Returns part of the Trunknumber, thats similar in all numbers of the trunk

        .DESCRIPTION
        Returns part of the Trunknumber, thats similar in all numbers of the trunk.

	    .PARAMETER NetphoneUser
        Has to be of type ippbxuser

    #>
}