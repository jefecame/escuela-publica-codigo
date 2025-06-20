"""
Nombre del archivo:
citas.py

Descripción:
Este módulo implementa un sistema sencillo para gestionar citas de ciudadanos.
Permite ingresar una lista de ciudadanos con el tiempo estimado de atención para cada uno,
valida que el tiempo esté en el rango permitido (1 a 120 minutos) y sugiere un orden de atención
basado en el menor tiempo estimado primero.

Funciones:
sistema_citas(): Solicita los datos de los ciudadanos, valida la entrada, ordena las citas y muestra el orden sugerido.

Autor:
Jesús Fernando Carrasco Mendoza
"""
def sistema_citas():
    cantidad_solicitudes = int(input("Ingrese la cantidad de ciudadanos que harán una solicitud: "))
    solicitudes = []
    for _ in range(cantidad_solicitudes):
        nombre = input("Ingrese el nombre del ciudadano: ")
        while True:
            try:
                tiempo = int(input(f"Ingrese el tiempo estimado en minutos para {nombre} (máximo 120): "))
                if 1 <= tiempo <= 120:
                    break
                else:
                    print("El tiempo estimado debe estar entre 1 y 120 minutos.")
            except ValueError:
                print("Por favor, ingrese un número entero para el tiempo estimado.")
        solicitudes.append({"nombre": nombre, "tiempo": tiempo})

    solicitudes.sort(key=lambda item: item["tiempo"])

    print("\nLista de citas sugerida (orden de atención):")
    for solicitud in solicitudes:
        print(f"Nombre: {solicitud['nombre']} - Tiempo Estimado: {solicitud['tiempo']} minutos")

if __name__ == "__main__":
    sistema_citas()