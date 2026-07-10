# excercise-union-and-union-all

1. ¿Cuántas filas devuelve cada consulta y por qué son distintas?

Consulta 2 (UNION ALL) devuelve 14 filas: Esto corresponde a las 7 filas de la sucursal norte sumadas a las 7 filas de la sucursal sur. Simplemente apila un resultado debajo del otro.

Consulta 1 (UNION) devuelve 11 filas: Esto ocurre porque UNION identifica las filas idénticas y las colapsa en una sola. Los productos 103 (Monitor), 104 (Teclado) y 106 (SSD) existen en ambas sucursales con exactamente el mismo ID, Nombre y Categoría. Al consolidar esos 3 pares duplicados, pasamos de 14 filas a 11.

Nota importante: Las Webcams (ID 107 y 111) no se eliminaron porque, aunque tienen el mismo nombre y categoría, sus id_producto son diferentes, por lo que SQL las considera filas distintas.

2. ¿Por qué UNION ALL es más eficiente que UNION?
UNION ALL es mucho más rápido porque su única tarea es concatenar los conjuntos de datos en memoria (pegar uno debajo del otro). Por el contrario, UNION debe realizar un trabajo extra: una vez que junta los datos, el motor de base de datos ejecuta internamente un algoritmo de ordenamiento o una tabla hash para comparar cada fila con el resto, identificar cuáles son duplicadas y eliminarlas. Esta operación consume bastante CPU y memoria adicional.

3. ¿En qué casos de negocio usarías cada uno? (Ejemplos)

Ejemplo de UNION: El equipo de Marketing quiere enviar un correo promocional consolidando las bases de datos de clientes de la web y clientes de tiendas físicas. Se usa UNION (por el correo electrónico) para evitar que a la misma persona le llegue el email dos veces si compró en ambos canales.

Ejemplo de UNION ALL: El equipo de Finanzas necesita analizar el historial completo de transacciones de tres procesadores de pago distintos (Visa, Mastercard, PayPal). Se usa UNION ALL porque queremos conservar todos los registros; si hay dos transacciones idénticas (mismo cliente, mismo monto y misma fecha), no son un duplicado, son dos cobros distintos que representan dinero real.

4. ¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo?
El motor de la base de datos abortará la ejecución y arrojará un error de sintaxis. Para que cualquier tipo de unión funcione, debe existir simetría estructural: la consulta "de arriba" debe tener exactamente la misma cantidad de columnas que la consulta "de abajo", y los tipos de datos deben ser compatibles en el mismo orden posicional (no puedes intentar unir una columna de tipo INT de una tabla con una columna de tipo VARCHAR en la misma posición de la otra).