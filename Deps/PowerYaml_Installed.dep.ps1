requires -version 3
<#
.SYNOPSIS
  PowerYaml Dep

.DESCRIPTION
  Defines PowerYaml Dependency

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
        -Name 'PowerYaml-Installed' `
        -Met { Get-Module -Name PowerYaml } `
        -Meet { Install-Module PowerYaml }