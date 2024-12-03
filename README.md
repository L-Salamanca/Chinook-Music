# 🎶 **Chinook Music - Base de Datos Musical**  

Una simulación de una base de datos de servicio de streaming musical, diseñada para gestionar información sobre artistas, álbumes, canciones y más. El proyecto incluye consultas, triggers y eventos para proporcionar una visión integral de cómo funcionan las bases de datos relacionales en un entorno realista.  

---

## 📌 **Descripción General**  

**Chinook Music** es un sistema de base de datos enfocado en el mundo de la música. Permite administrar datos de canciones, artistas, álbumes y clientes, emulando la funcionalidad de un servicio de streaming. Este proyecto es ideal para quienes desean comprender el funcionamiento de bases de datos SQL, realizar consultas complejas y gestionar eventos.  

---

## 🗂️ **Características Principales**  

- **Gestión de Entidades Clave:**  
  - Artistas, álbumes, canciones, clientes, facturas, empleados, géneros y listas de reproducción.  
- **Consultas DQL:**  
  - Realización de consultas avanzadas para filtrar y visualizar datos.  
- **Triggers y Eventos:**  
  - Automatización de procesos y validación de datos.  
- **Almacenamiento en MySQL:**  
  - Datos persistentes, con tablas bien estructuradas y relaciones definidas.  

---

## 📋 **Requisitos del Sistema**  

- **Sistema Operativo:** Compatible con Linux, macOS y Windows.  
- **Base de Datos:** MySQL 8.0 o superior.  
- **Herramienta:** MySQL Workbench para gestión visual.  

---

## ⚙️ **Instalación y Configuración**  

1. **Descargar el Proyecto:**  
   ```bash  
   git clone https://github.com/tu-repositorio.git  
   cd chinook-music  
   ```  

2. **Abrir en MySQL Workbench:**  
   - Cargue los archivos `.sql` en MySQL Workbench.  

3. **Importar los Archivos:**  
   - Primero, ejecute `ddl.sql` para crear la estructura de la base de datos.  
   - Luego, importe `dml.sql` para insertar los datos.  
   - Cargue y ejecute los demás archivos según sea necesario (`dql_select.sql`, `dql_triggers.sql`, etc.).  

4. **Ejecutar Consultas:**  
   - Seleccione una consulta y haga clic en el icono del rayo (⚡) para ejecutarla.  

---

## 📂 **Archivos Incluidos**  

- **ddl.sql:** Definición de tablas y relaciones (estructura de la base de datos).  
- **dml.sql:** Inserción de datos iniciales (población de tablas).  
- **dql_select.sql:** Consultas DQL (SELECT) para filtrar y mostrar datos.  
- **dql_funciones.sql:** Funciones almacenadas para operaciones comunes.  
- **dql_triggers.sql:** Triggers para automatizar la gestión de datos.  
- **dql_eventos.sql:** Eventos programados para la base de datos.  
- **Diagrama.png:** Diagrama entidad-relación de la base de datos.  
- **Readme.md:** Documentación del proyecto.  

---

## 📊 **Estructura de la Base de Datos**  

El proyecto incluye las siguientes tablas:  

- **Album:** Información de los álbumes (ID, título, artista).  
- **Artist:** Datos de artistas (ID, nombre).  
- **Customer:** Información de clientes (datos personales, soporte).  
- **Employee:** Datos del personal (jerarquía, contacto).  
- **Genre:** Clasificación de géneros musicales.  
- **Invoice:** Facturas generadas para clientes.  
- **InvoiceLine:** Detalles de cada línea de factura (canciones compradas).  
- **MediaType:** Tipos de medios disponibles.  
- **Playlist:** Listas de reproducción creadas.  
- **PlaylistTrack:** Relación entre listas de reproducción y canciones.  
- **Track:** Información detallada de cada canción.  

---

## 💻 **Uso del Proyecto**  

- **Pruebas de Consultas:**  
  - Ejecute las consultas para observar la interacción entre tablas.  
- **Modificación de Datos:**  
  - Altere y manipule registros para experimentar con triggers y eventos.  
- **Análisis de Resultados:**  
  - Utilice las consultas para extraer información significativa sobre álbumes, artistas y ventas.  

---

## 👨‍💻 **Autor**  

Proyecto desarrollado por **Luis Fernando Pérez Salamanca**.  

---


