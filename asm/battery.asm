.586
.model flat, stdcall
option casemap :none

include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib

include \masm32\macros\macros.asm

.data?
sysp SYSTEM_POWER_STATUS <?>

.code
start:
  invoke GetSystemPowerStatus,addr sysp
  .if sysp.ACLineStatus == 1
  	invoke MessageBox,NULL,chr$("Ac power status : Online"),NULL,MB_ICONINFORMATION
  .else
  	invoke MessageBox,NULL,chr$("Ac power status : Offline"),NULL,MB_ICONINFORMATION
 .endif
 .if sysp.BatteryFlag==128
 	invoke MessageBox,NULL,chr$("No Battery"),NULL,MB_ICONINFORMATION
 .else
 	.if sysp.BatteryLifePercent ==100
 		invoke MessageBox,NULL,chr$("Battery Full"),NULL,MB_ICONINFORMATION
 	.else
 		invoke MessageBox,NULL,chr$("Battery Not Full"),NULL,MB_ICONINFORMATION
 	.endif
 .endif
         invoke ExitProcess,0
end start
