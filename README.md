This PowerShell Script is written to clean Dotnet Core publish directory. Issue has been described in detail at
https://github.com/aspnet/websdk/issues/179. It is also explained under blog post at 
https://mohitgoyal.co/2018/08/30/publishing-dotnet-core-creates-multiples-nested-directories/. As part of the design process, there is no
inbuilt dotnet clean command or --clean parameter which can be used to make sure that publish directory does not contain anything else. 
This can create issues in a continuous build or intergration process. This script is written to help with the same. 

This script can be invoked in the following manner:

.\dotnet-clean.ps1 -directory "publish" -workingdirectory "C:\vsts\_work\"

The script will check if the $workingdirectory is a valid one or not. It will check for all instances of $directory inside the context of
the $workingdirectory and removes them along with any files contained in them. In case it is not valid, it will proceed to execute in the
current workspace. For most of the agents, this should be replaced by current context of the build workspace.

