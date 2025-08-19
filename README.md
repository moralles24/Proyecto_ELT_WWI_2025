# 📊 Proyecto Wide World Importers - Data Warehouse

Este proyecto consiste en el diseño e implementación de un **Data Warehouse** para la empresa ficticia **Wide World Importers**, utilizando el ecosistema de **Microsoft SQL Server**.
    
El objetivo principal es centralizar, transformar y optimizar la información proveniente de la base de datos transaccional, facilitando el análisis estratégico y la toma de decisiones mediante un flujo completo de **ETL → Modelo Tabular → Análisis**.

---

## 🚀 Objetivos

- Implementar un **Data Warehouse** en un esquema dimensional optimizado (modelo estrella).  
- Diseñar y desarrollar procesos **ETL con SSIS** para extraer, transformar y cargar la información.  
- Construir un **modelo tabular en SSAS** con métricas, jerarquías y segmentaciones.  
- Optimizar el rendimiento de consultas analíticas para soportar decisiones estratégicas.  
- Demostrar la integración completa del ciclo de **Business Intelligence** con tecnologías de Microsoft.  

---

## 📂 Alcance del Proyecto

- **Fuente de datos:** Base transaccional Wide World Importers (ventas, compras, inventario, logística).  
- **Modelo de datos:** Esquema en estrella con tablas de hechos y dimensiones.  
- **Infraestructura:** Data Warehouse implementado en el mismo servidor que la base transaccional (para fines académicos).  

### Exclusiones
- No se migraron datos de producción real.  
- No se implementaron mecanismos avanzados de seguridad.  
- No se desarrolló un modelo OLAP multidimensional.  

---

## 🛠️ Tecnologías Utilizadas

- **SQL Server Integration Services (SSIS)** → Procesos ETL  
- **SSISDB** → Repositorio y administración de paquetes  
- **SQL Server Agent** → Automatización de Jobs  
- **SQL Server Analysis Services (SSAS - Tabular)** → Modelo tabular  
- **SQL Server Management Studio (SSMS)** → Administración y consultas  
- *(Opcional a futuro: Power BI / Excel para visualización y dashboards)*  

---

## 📦 Entregables

- **Data Warehouse** con modelo dimensional.  
- **Paquetes ETL en SSIS**, desplegados en **SSISDB**.  
- **Automatización de ejecución** con **SQL Server Agent**.  
- **Modelo tabular en SSAS** con medidas DAX, jerarquías y perspectivas.  
- **Documentación técnica paso a paso** con capturas y explicación detallada.  

---

## 📊 Flujo de Implementación

1. Restauración de la base **Wide World Importers** en SQL Server.  
2. Creación del **Data Warehouse** (modelo estrella).  
3. Procesos **ETL en SSIS** → Extracción, transformación y carga.  
4. **Despliegue en SSISDB** y configuración de **Jobs en SQL Server Agent**.  
5. **Modelo Tabular en SSAS** → Creación de medidas DAX, jerarquías y roles.  
6. *(Opcional a futuro: visualización con Power BI o Excel).*  

---

## ✅ Conclusiones

- Se logró implementar exitosamente un ciclo completo de BI (**ETL → DWH → Modelo Tabular → Reportes**).  
- El proceso ETL garantiza integridad y consistencia en los datos.  
- El modelo tabular optimiza consultas analíticas y mejora la accesibilidad.  
- La solución permite detectar patrones y tendencias para apoyar decisiones estratégicas.  

---

## 🔮 Perspectivas Futuras

- Integración con **Big Data** y análisis en tiempo real.  
- Aplicación de **Machine Learning** sobre el DWH.  
- Escalabilidad para múltiples fuentes de datos empresariales.  
- Desarrollo de dashboards interactivos en **Power BI** o **Excel**.  

---

## 📌 Autor

Proyecto desarrollado por **Daniel Morales López**  
Data Engineer | Especialista en procesos ETL, Data Warehousing y Business Intelligence  
Costa Rica 🌎 

---
