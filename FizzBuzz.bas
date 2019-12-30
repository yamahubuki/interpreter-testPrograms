FOR a = 1 TO 10
	flg=0
	b = a
	WHILE b >= 3
		b = b - 3
	WEND
	IF b = 0 THEN
		PRINT("Fizz")
		flg=1
	ENDIF

	b = a
	WHILE b >= 5
		b = b - 5
	WEND
	IF b = 0 THEN
		PRINT("Buzz")
		flg=1
	ENDIF

	IF flg=0 THEN PRINT(a+"\n") ELSE PRINT("\n")

NEXT a
END

