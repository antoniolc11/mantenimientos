--Muestra todas las incidencias--

SELECT cod_incidencia, 
       fecha_creacion, 
       labor, 
       oc.nombre || ' ' || oc.apellido1 Operario_Creador,
       oa.nombre || ' ' || oa.apellido1 Operario_Asignado,
       nom_estado Estado,
       nom_ubicacion Ubicacion,
       nom_depart Departamento, 
       nom_categoria Categoria
FROM incidencia JOIN operario oa ON id_oper_asignado = oa.id_oper 
     JOIN operario oc ON id_oper_creador = oc.id_oper
     JOIN estado USING(cod_estado)
     JOIN ubicacion USING(cod_ubicacion)
     JOIN departamento USING(cod_depart)
     JOIN categoria USING(cod_categoria);
     
--Modifica el estado de una incidencia--
     
UPDATE incidencia
   SET cod_estado = (SELECT cod_estado FROM estado WHERE nom_estado = 'Finalizado')
 WHERE cod_incidencia = 100; 


--Muestra el operario, incidencia, fecha de la reparacion, estado y descripción de la incidencia con el codigo 100--
SELECT operario.nombre Operario, cod_incidencia, fecha_reparacion, nom_estado Estado, des_reparacion 
FROM oper_incidencia JOIN incidencia USING(cod_incidencia) 
     JOIN estado USING(cod_estado) 
     JOIN operario USING(id_oper)                               
WHERE cod_incidencia = 100;

--Muestra el nombre de los operarios y el departamento al que pertenecen.--
select nombre Operario, nom_depart Departamento
from oper_depart JOIN operario USING(id_oper)
     JOIN departamento USING(cod_depart);
