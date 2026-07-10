-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Nombre: Juan Marcelo Arteaga
-- Fecha : 9/7/2026
-- ══════════════════════════════════════════

-- ── CONSULTA 1: UNION ────────────────────
-- Reporte de Catálogo Unificado
-- Solución: Seleccionamos solo los datos descriptivos del producto para que 
-- el UNION detecte y elimine las coincidencias exactas entre sucursales.

SELECT id_producto, nombre_producto, categoria 
FROM inventario_sucursal_norte

UNION

SELECT id_producto, nombre_producto, categoria 
FROM inventario_sucursal_sur;


-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Solución: Al usar UNION ALL, concatenamos absolutamente todos los registros.


SELECT id_producto, nombre_producto, categoria 
FROM inventario_sucursal_norte

UNION ALL

SELECT id_producto, nombre_producto, categoria 
FROM inventario_sucursal_sur;


-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Verificación del volumen de filas devuelto por cada operador.

SELECT COUNT(*) AS filas_union FROM (
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_norte
    UNION
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_sur
) AS resultado_union;

SELECT COUNT(*) AS filas_union_all FROM (
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_norte
    UNION ALL
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_sur
) AS resultado_union_all;