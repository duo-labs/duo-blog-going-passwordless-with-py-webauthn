<#
.SYNOPSIS
    Starts the demo Flask server.

.DESCRIPTION
    This script sets the necessary environment variables for a Flask application
    and runs the Flask server, ensuring that relative paths are rooted to the 
    directory containing this script.

.PARAMETER None
    No parameters are required to run this script.

.NOTES
    Author: DJ Stomp <85457381+DJStompZone@users.noreply.github.com>
    License: MIT (https://opensource.org/license/mit)
    Article: https://duo.com/blog/going-passwordless-with-py-webauthn
    Repo: https://github.com/duo-labs/duo-blog-going-passwordless-with-py-webauthn

.EXAMPLE
    .\start-flask.ps1
    Runs the script to start the Flask server
#>

function Start-FlaskApp {
    <#
    .SYNOPSIS
        Starts a Flask development server.

    .DESCRIPTION
        Sets the necessary environment variables and starts the Flask development server.

    .PARAMETER FlaskApp
        The path to the Flask application file.

    .PARAMETER FlaskExe
        The path to the Flask executable in the virtual environment.

    .EXAMPLE
        Start-FlaskApp -FlaskApp "src\app.py" -FlaskExe "venv\Scripts\flask.exe"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]$FlaskApp,

        [Parameter(Mandatory, Position = 1)]
        [string]$FlaskExe
    )

    # Set environment variables
    $env:FLASK_ENV = "development"
    $env:FLASK_APP = $FlaskApp

    # Start the Flask development server
    & $FlaskExe run -h localhost
}


# Invoke if the script was run with ./Start-Server.ps1 (rather than being imported as a module)
if (($MyInvocation.InvocationName -eq "./$(Split-Path -Leaf $PSCommandPath)") -or ($MyInvocation.InvocationName -eq ".\$(Split-Path -Leaf $PSCommandPath)")) {
    # Get the directory containing this script
    $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

    # Define paths for the Flask app and Flask executable
    $FlaskAppPath = Join-Path -Path $ScriptDir -ChildPath "src\app.py"
    $FlaskExePath = Join-Path -Path $ScriptDir -ChildPath "venv\Scripts\flask.exe"

    # Start the Flask application
    Start-FlaskApp -FlaskApp $FlaskAppPath -FlaskExe $FlaskExePath
}
