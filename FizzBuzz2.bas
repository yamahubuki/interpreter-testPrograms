flg3=0
flg5=0
FOR a = 1 TO 40
	flg=0
	IF flg3=0 THEN
		flg3=1
	ELSEIF flg3=1 THEN
		flg3=2
	ELSE
		PRINT "Fizz"
		flg3=0
		flg=1
	ENDIF

	IF flg5=0 THEN
		flg5=1
	ELSEIF flg5=1 THEN
		flg5=2
	ELSEIF flg5=2 THEN
		flg5=3
	ELSEIF flg5=3 THEN
		flg5=4
	ELSE
		PRINT "Buzz"
		flg5=0
		flg=1
	ENDIF

	IF flg=0 THEN
		PRINT a
	ENDIF

	PRINT "\n"

NEXT a
