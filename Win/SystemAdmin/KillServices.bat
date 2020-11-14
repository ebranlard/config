:: 
:: SC CONFIG "<nameservice>" START= ( BOOT, or SYSTEM, or AUTO, or DEMAND, or DISABLED, or DELAYED-AUTO



:: --------------------------------------------------------------------------------
:: --- Get the list of services:
:: sc query
:: sc [<ServerName>] getkeyname [<ServiceDisplayName>] [<BufferSize>]
:: --------------------------------------------------------------------------------
:: 
:: SERVICE_NAME: UsoSvc          DISPLAY_NAME: Update Orchestrator Service
:: SERVICE_NAME: wuauserv        DISPLAY_NAME: Windows Update
:: SERVICE_NAME: EventLog        DISPLAY_NAME: Windows Event Log
:: SERVICE_NAME: Schedule        DISPLAY_NAME: Task Scheduler

:: --------------------------------------------------------------------------------
:: ---  Stop or set services start options
:: --------------------------------------------------------------------------------
:: sc stop <ServerName>
:: sc config "Name of Service" start= disabled
:: 

sc config "Schedule" start= disabled
sc config "UsoSvc"   start= disabled
::sc config "EventLog" start= disabled
sc config "Schedule" start= disabled

sc stop "UsoSvc"
sc stop "wuauserv"
::sc stop "EventLog"
sc stop "Schedule"


:: --------------------------------------------------------------------------------
:: --- Start services manually
:: --------------------------------------------------------------------------------
::sc start "UsoSvc"
::sc start "wuauserv"
::sc start "EventLog"
::sc start "Schedule"
