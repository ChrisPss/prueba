# Billetera Digital - Caso 1 (Servlet + JSP)

Aplicación web desarrollada en Java puro (sin frameworks) que simula una billetera electrónica básica. 
El estado de la cuenta (saldo y movimientos recientes) se mantiene en memoria utilizando la sesión HTTP (`HttpSession`)

##  Tecnologías y Versiones Utilizadas
* **Java JDK:** 17 (o 21)
* **Apache Tomcat:** 10.1 o superior (compatible con Jakarta EE)
* **Maven:** 3.8+
* **Jakarta EE / Servlets:** 6.0
* **JSTL:** 3.0 (`jakarta.tags.core`)
* **Frontend:** Bootstrap 5.3

---------------------------------------

## Pasos de Ejecución y Despliegue

### Ejecución desde el código fuente (Maven)
1. Abre tu IDE de preferencia (IntelliJ IDEA o Eclipse).
2. Importa el proyecto como un **Maven Project** existente.
3. Levanta el servidor tomcat 
4. Usa tu navegador de confianza y busca:
   `http://localhost:8080/bcp/`
5. Despues se mostrara la ventana donde esta el from de la billetera.
6. Como paso final se realiza la recarga o gasto segun se necesite
   considerando primero ejecutar las validaciones
7. Realizar una Recarga o monto con valores numericos:
   Monto < 0 o Monto = 0 (Se mostrara un mensaje que no se puede realizar)
   sí Monto (recarga o gasto) < Saldo
   (Se mostrara un mensaje con saldo insuficiente)
8. Con eso se quedará demostrado que el proyecto crumple con todos los criterios solicitados.

 
