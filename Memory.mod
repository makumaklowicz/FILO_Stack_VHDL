MODEL
MODEL_VERSION "v1998.8";
DESIGN "Memory";

/* port names and type */
INPUT S:PIN3 = In_BtnValue<0>;
INPUT S:PIN5 = In_BtnValue<1>;
INPUT S:PIN7 = In_BtnValue<2>;
INPUT S:PIN10 = In_BtnValue<3>;
OUTPUT S:PIN97 = Out_BtnValue<0>;
OUTPUT S:PIN100 = Out_BtnValue<1>;
OUTPUT S:PIN102 = Out_BtnValue<2>;
OUTPUT S:PIN104 = Out_BtnValue<3>;
OUTPUT S:PIN69 = Out_FullStack;
OUTPUT S:PIN113 = Out_MemCellValue<0>;
OUTPUT S:PIN115 = Out_MemCellValue<1>;
OUTPUT S:PIN117 = Out_MemCellValue<2>;
OUTPUT S:PIN119 = Out_MemCellValue<3>;

/* timing arc definitions */
In_BtnValue<0>_Out_BtnValue<0>_delay: DELAY In_BtnValue<0> Out_BtnValue<0>;
In_BtnValue<1>_Out_BtnValue<1>_delay: DELAY In_BtnValue<1> Out_BtnValue<1>;
In_BtnValue<2>_Out_BtnValue<2>_delay: DELAY In_BtnValue<2> Out_BtnValue<2>;
In_BtnValue<3>_Out_BtnValue<3>_delay: DELAY In_BtnValue<3> Out_BtnValue<3>;

/* timing check arc definitions */

ENDMODEL
