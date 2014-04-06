requires -version 3
<#
.SYNOPSIS
  PsEnv Dep

.DESCRIPTION
  Defines PsEnv Dependency

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
        -Name 'PsEnv-Installed' `
        -Met { Get-Module -Name PsEnv } `
        -Meet { Install-Module PsEnv }