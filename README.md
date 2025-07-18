# Blockchain Distribuida con Minería Paralela

Este proyecto implementa una blockchain distribuida desde cero, con minería basada en prueba de trabajo (PoW) y capacidad de cómputo paralela usando CPU o GPU (CUDA). Utiliza una arquitectura asíncrona basada en eventos, soportada por Redis, RabbitMQ y desplegada sobre Google Cloud Platform con Kubernetes y Terraform.

## 📋 Tabla de Contenidos

1. [Arquitectura del Sistema](#arquitectura-del-sistema)
2. [Tecnologías utilizadas](#tecnologías-utilizadas)
3. [Demostración del Funcionamiento (Frontend)](#demostración-del-funcionamiento-frontend)
   - [Dashboard](#dashboard)
   - [Explorador de Bloques](#explorador-de-bloques)
   - [Transacciones](#transacciones)
   - [Estadísticas de la Red](#estadísticas-de-la-red)
4. [Comparativa de Rendimiento: CPU vs GPU](#comparativa-de-rendimiento-cpu-vs-gpu)
5. [Documento Técnico](#documento-técnico)

---

## Arquitectura del Sistema

La blockchain opera sobre una red asíncrona donde el **Coordinador** gestiona la creación de bloques y la distribución de tareas. Los **Mining Pools** organizan grupos de mineros, asignando subtareas. Los **Mineros** (individuales o de pool) ejecutan la Prueba de Trabajo, con la opción de aprovechar la **GPU (CUDA)** para un mayor rendimiento. Todo el estado crítico se persiste en Redis.

![Diagrama de Arquitectura](https://github.com/user-attachments/assets/2277982a-0912-4de3-91aa-60e39261fe1c)

---

## Tecnologías utilizadas

| Área              | Tecnología                                     |
|-------------------|------------------------------------------------|
| Lenguajes         | Java, Python                                   |
| Mensajería        | RabbitMQ                                       |
| Almacenamiento    | Redis                                          |
| Cómputo paralelo  | CUDA                                           |
| Infraestructura   | GCP, Kubernetes (GKE), Terraform               |
| CI/CD             | GitHub Actions                                 |

---

## Demostración del Funcionamiento (Frontend)

Para visualizar el funcionamiento de la blockchain, se desarrolló una interfaz sencilla que permite monitorear el estado de la red, los bloques minados y las transacciones.

### Dashboard

Una vista general del estado actual de la blockchain.
![Dashboard de la Blockchain](https://github.com/user-attachments/assets/52fc41ae-38a5-42ac-a3f6-d8439429dca2)

### Explorador de Bloques

Detalle de los bloques minados, incluyendo su hash, transacciones y timestamp.
![Explorador de Bloques](https://github.com/user-attachments/assets/9d0529df-8ab6-4098-a540-e014b1f884d7)
![Detalle de un Bloque](https://github.com/user-attachments/assets/fe65cbbd-f359-491f-a77d-2e37b793a82b)

### Transacciones

Visualización de transacciones pendientes y la capacidad de generar nuevas transacciones o ajustar la dificultad de minería.
![Transacciones Pendientes](https://github.com/user-attachments/assets/9f23de6a-ba96-45c6-8bbc-fe2b305db384)
![Generación de Transacciones y Ajuste de Dificultad](https://github.com/user-attachments/assets/3883cd4f-88da-492e-a3ab-42b409dbb3b8)

### Estadísticas de la Red

Gráficos y métricas clave sobre el rendimiento de la blockchain.
![Estadísticas Generales](https://github.com/user-attachments/assets/f0041c63-fbe4-411b-8ee7-4b152f0e90d9)
![Gráficos de Estadísticas](https://github.com/user-attachments/assets/9532fa1e-7053-4622-b9a4-66e190f576a4)

---

## Comparativa de Rendimiento: CPU vs GPU

El rendimiento del sistema se evaluó mediante pruebas de minería distribuidas bajo diferentes cargas y niveles de dificultad, utilizando un pool de 5 instancias de CPU en la nube y un minero individual con GPU (GTX 1660 Super, CUDA).

A continuación se presenta un resumen visual comparando ambas arquitecturas según dos métricas clave:

- ⏱️ **Tiempo promedio de minado (segundos)**
- ⛏️ **Cantidad de bloques minados**

![Comparativo CPU vs GPU](https://github.com/user-attachments/assets/23a0e3cd-ae03-4915-a5ab-c50ea70a6472)

**Conclusiones clave:**

- La **GPU supera consistentemente al pool de CPU**, especialmente a dificultad 6 y 7.
- En cargas altas (10.000 transacciones), la GPU logra minar bloques en la mitad del tiempo.
- A dificultad 7, las CPUs fallan o presentan tiempos no sostenibles, mientras que la GPU mantiene una respuesta estable.
- El sistema distribuye adecuadamente la carga hasta cierto umbral, donde la potencia de cómputo se vuelve el cuello de botella.

---

## Documento Técnico

Para una exploración exhaustiva de la implementación, el diseño de cada componente y los detalles de las decisiones técnicas detrás de este proyecto, consulta el documento técnico completo.

[Enlace al Documento Técnico Completo](https://drive.google.com/file/d/1YgQ6T4gPgXAMjoayqINlMAoKpbfHYNJ3/view?usp=drive_link)
