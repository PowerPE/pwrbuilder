#requires -version 3
<#
.SYNOPSIS
  PwrBuilder Directories
 
.DESCRIPTION
  PwrBuilder Dorectories Installer
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
#----------------------------------------------------------[Declarations]----------------------------------------------------------
 
#Directories Directory
$PwrBldrModuleRoot = $PSScriptRoot + "\.."
$PwrBldrWorkingRoot = $env:USERPROFILE + "\PowerShell\PwrBuilder"
$PwrBldrLogs = $PwrBldrWorkingRoot + "\log"
$PwrBldrProjects = $PwrBldrWorkingRoot + "\projects"
$PwrBldrComponents = $PwrBldrWorkingRoot + "\components"
$PwrBldrModules = $PwrBldrWorkingRoot + "\modules"
$PwrBldrStorage = $PwrBldrWorkingRoot + "\storage"
$PwrBldrCache = $PwrBldrWorkingRoot + "\cache"
$PwrBldrWorkspace = $PwrBldrWorkingRoot + "\workspace"

#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrDirectories{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "PwrBuilder Directories"
  }
  
  Process{
    Try{
      if(-not (Test-Path $PwrBldrWorkingRoot)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Root Directory"
        New-Item -Path $PwrBldrWorkingRoot -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrLogs)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Log Directory"
        New-Item -Path $PwrBldrLogs -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrProjects)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Project Directory"
        New-Item -Path $PwrBldrProjects -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrComponents)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Component Directory"
        New-Item -Path $PwrBldrComponents -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrModules)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Modules Directory"
        New-Item -Path $PwrBldrModules -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrStorage)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Storage Directory"
        New-Item -Path $PwrBldrStorage -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrCache)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Cache Directory"
        New-Item -Path $PwrBldrCache -ItemType Directory -Force
      }
      if(-not (Test-Path $PwrBldrWorkspace)) {
        Log-Write -LogPath $sLogFile -LineValue "Creating - PwrBuilder Workspace Directory"
        New-Item -Path $PwrBldrWorkspace -ItemType Directory -Force
      }
      Log-Write -LogPath $sLogFile -LineValue "PwrBuilder Directories - All Created or Exist"
    }

    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "PwrBuilder Directories - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
#>