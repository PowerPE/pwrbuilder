requires -version 3
<#
.SYNOPSIS
  PsJson Dep

.DESCRIPTION
  Defines PsJson Dependency

.PARAMETER Name
    Dep Name
.PARAMETER Met
    Test if Dep is met
.PARAMETER Meet
    Meet Dep

.NOTES
  Version:        1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>

#----------------------------------------------------------[Declarations]----------------------------------------------------------

New-PSBabushkaDep `
        -Name 'PsJson-Installed' `
        -Met { Get-Module -Name PsJson } `
        -Meet { Install-Module PsJson }