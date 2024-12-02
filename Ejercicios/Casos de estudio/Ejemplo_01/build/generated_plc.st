PROGRAM EP1
  VAR
    Start1 : BOOL;
    Stop1 : BOOL;
    Motor1 : BOOL;
    Start2 : BOOL;
    Stop2 : BOOL;
    Motor2 : BOOL;
    L1 : BOOL;
    L2 : BOOL;
  END_VAR

  Motor1 := NOT(Stop1) AND (Motor1 OR Start1);
  Motor2 := NOT(Stop2) AND (Motor2 OR Start2);
  L1 := Motor2 AND Motor1;
  L2 := NOT(L1) AND (Motor1 OR Motor2);
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : EP1;
  END_RESOURCE
END_CONFIGURATION
