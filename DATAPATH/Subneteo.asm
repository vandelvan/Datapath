SW $zero, $zero, 5#Inicializando broad
SW $zero, $zero, 6
SW $zero, $zero, 7
SW $zero, $zero, 8
SW $zero, $zero, 9#min
SW $zero, $zero, 10
SW $zero, $zero, 11
SW $zero, $zero, 12
ADDI $s0, $zero, 255#Incializo 25para utilizarlo en seguida
ADDI $t0, $zero, 0#inicializo i en t0
SW $zero, $zero, 13#max
SW $zero, $zero, 14
SW $zero, $zero, 15
SW $zero, $zero, 16
SW $s0, $zero, 17#Mask255
SW $s0, $zero, 18
SW $s0, $zero, 19
SW $s0, $zero, 20
LW $t1, $zero, 1#Traigo el arreglo OCT a registros
LW $t2, $zero, 2
LW $t3, $zero, 3
LW $t4, $zero, 4
NOP
NOP
NOP
NOP
SLTI $t8, $t1, 255#si 255 > $t1 sera igual a 1
NOP
NOP
NOP
BEQ $t8, $at, 4
NOP
NOP
NOP
ADDI $t1, $zero, 254
SLTI $t8, $t1, 1#si 1 > $t1 sera igual a 1
NOP
NOP
NOP
BNE $t8, $at, 4
NOP
NOP
NOP
ADDI $t1, $zero, 1
NOP
SLTI $t8, $t2, 255#si 255 > $t2 sera igual a 1
NOP
NOP
NOP
BEQ $t8, $at, 4
NOP
NOP
NOP
ADDI $t2, $zero, 254
SLTI $t8, $t2, 1#si 1 > $t2 sera igual a 1
NOP
NOP
NOP
BNE $t8, $at, 4
NOP
NOP
NOP
ADDI $t2, $zero, 1
NOP
SLTI $t8, $t3, 255#si 255 > $t3 sera igual a 1
NOP
NOP
NOP
BEQ $t8, $at, 4
NOP
NOP
NOP
ADDI $t3, $zero, 254
SLTI $t8, $t3, 1#si 1 > $t3 sera igual a 1
NOP
NOP
NOP
BNE $t8, $at, 4
NOP
NOP
NOP
ADDI $t3, $zero, 1
NOP
SLTI $t8, $t4, 255#si 255 > $t4 sera igual a 1
NOP
NOP
NOP
BEQ $t8, $at, 4
NOP
NOP
NOP
ADDI $t4, $zero, 254
SLTI $t8, $t4, 1#si 1 > $t4 sera igual a 1
NOP
NOP
NOP
BNE $t8, $at, 4
NOP
NOP
NOP
ADDI $t4, $zero, 1
NOP
SUB $t9, $t9, $t9#Hago el registro t9=0
LW $gp, $zero, 0#Obtengo la mascara de red de la MD
NOP
NOP
NOP
ADDI $t9, $zero, 1#Inicializo Res
SLTI $t8, $gp, 30 #si 30 > mascara
ADDI $s7, $s7, 1#Crear el 24 para comparar en el futuro
NOP
NOP
NOP
BEQ $t8, $at, 4
NOP
NOP
NOP
J 0x302#termina el programa
NOP
NOP
NOP
SLT $t8, $s7, $gp #si mascara> 24
NOP
NOP
NOP
BEQ $t8, $at, 4
NOP
NOP
NOP
J 0x302#termina el programa
NOP
NOP
NOP
ADDI $s1, $zero, 32#declaro un 32
NOP
NOP
NOP
SUB $s0, $s1, $gp#aux=32-mask
ADDI $t0, $zero, 1#inicializamos i en 1
ADDI $s3, $zero, 2#inicializamos num en 2
ADDI $s0, $s0, 1#aux+=1
ADDI $s2, $zero, 1#inicializamos res en 1
NOP
NOP
NOP
NOP
NOP
SLT $t8, $t0, $s0#si i < aux devuelve 1
NOP
NOP
NOP
BNE $t8, $at, 9#si la condicion es falsa
NOP
NOP
NOP
MUL $s2, $s2, $s3#res = res*num
ADDI $t0, $t0, 1#incrementa i en 1
NOP
NOP
NOP
J 0x147#regresa a la condicion
NOP
NOP
NOP
LW $s3, $zero, 20#cargamos mask[3]
NOP
NOP
NOP
ADDI $s3, $s3, 1#sumamos 1 a mask[3]
NOP
NOP
NOP
SUB $s3, $s3, $s2#mask[3]=mask[3]-res
LW $t0, $zero, 4#i=oct[3]
NOP
NOP
NOP
NOP
BEQ $t0, $zero, 25#branch siguiente for<----------
NOP
NOP
NOP
MOD $s7, $s2, $t0#i%res
NOP
NOP
NOP
BNE $s7, $zero, 11#if(i%res==0)
NOP
NOP
NOP
SUB $t4, $t4, $t4#igualamos oct[3]=0
NOP
NOP
NOP
ADD $t4, $t4, $t0#oct[3]=i
NOP
NOP
NOP
SUB $t0, $t0, $at#i--
NOP
NOP
NOP
J 0x178
NOP
NOP
NOP
SUB $t4, $t4, $at#-1 porque la ultima vez no entro y dejo 1
NOP
NOP
SUB $t0, $t0, $t0#establece i en 0
NOP
NOP
NOP
SLTI $t8, $t0, 4#si i<4 devuelve 1
NOP
NOP
NOP
BNE $t8, $at, 71# cuando ya no es 1 salta a res=res-2,se invirtieron los if y else del codigo
NOP
NOP
NOP
SLTI $s4, $t0, 3 #si i < 3 devuelve 1
NOP
NOP
NOP
BNE $s4, $at, 29#si no es igual salta al else
NOP
NOP
NOP
SUB $t5, $t5, $t5#inicializamos broad/min/max[0]=0
SUB $t6, $t6, $t6#inicializamos broad/min/max[1]=0
SUB $t7, $t7, $t7#inicializamos broad/min/max[2]=0
NOP
NOP
NOP
ADD $t5, $t5, $t1#asignamos broad/min/max[0]=oct[0]
ADD $t6, $t5, $t2#asignamos broad/min/max[1]=oct[1]
ADD $t7, $t5, $t3#asignamos broad/min/max[2]=oct[2]
NOP
NOP
NOP
SW $t5, $zero, 5#guardamos broad[0]en datamemory[5]
SW $t6, $zero, 6#guardamos broad[1]en datamemory[6]
SW $t7, $zero, 7#guardamos broad[2]en datamemory[7]
SW $t5, $zero, 9#guardamos min[0]en datamemory[9]
SW $t6, $zero, 10#guardamos min[1]en datamemory[10]
SW $t7, $zero, 11#guardamos min[2]en datamemory[11]
SW $t5, $zero, 13#guardamos max[0]en datamemory[13]
SW $t6, $zero, 14#guardamos max[1]en datamemory[14]
SW $t7, $zero, 15#guardamos max[2]en datamemory[15]
ADDI $t0, $t0, 3#le sumamos 3 a i
J 0x213
NOP
NOP
NOP
SUB $t9, $t9, $t9#inicializamos broad[3]=0
NOP
NOP
NOP
ADD $t9, $t4, $s2#suma broad[3]=oct[3]+res
NOP
NOP
NOP
SUB $t9, $t9, $at#le resta 1 a broad[3]
NOP
NOP
NOP
NOP
SW $9, $zero, 8#guardamos broad[3]en datamemory[8]
SUB $t9, $t9, $at#le vuelve a resta 1 a broad[3]
NOP
NOP
NOP
SW $9, $zero, 16#guardamos max[3]en datamemory[16]
SUB $t9, $t9, $t9#establecemos min[3]=0
NOP
NOP
NOP
ADDI $t9, $t4, 1#sumamos min[3]+1
NOP
NOP
NOP
SW $9, $zero, 12#guardamos min[3]en datamemory[12]
ADDI $t0, $t0, 1#aumentamos en 1 a i
NOP
NOP
NOP
J 0x213
SUB $s7, $s7, $s7#inicializamos s7=0
NOP
NOP
NOP
SUB $s2, $s2, $v0#restamos res-2
NOP
NOP
NOP 
SW $s2, $zero, 21#guardamos el resultado de res en datamemory[21]
SW $t1, $zero, 1#guardamos oct[0] en datamemory[1]
SW $t2, $zero, 2#guardamos oct[1] en datamemory[2]
SW $t3, $zero, 3#guardamos oct[2] en datamemory[3]
SW $t4, $zero, 4#guardamos oct[3] en datamemory[4]
SW $s3, $zero, 20#guardamos mask255[3] en datamemory[20]
NOP
NOP
