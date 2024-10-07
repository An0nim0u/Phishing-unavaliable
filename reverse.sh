#!/bin/bash

# Función para obtener la geolocalización
obtener_geolocalizacion() {
    # Obtener coordenadas del dispositivo
    coordenadas=$(termux-location | jq -r '.latitude, .longitude')
    echo "Coordenadas obtenidas: $coordenadas"
    
    # Enviar las coordenadas a tu servidor local
    curl -X POST http://<Tu_IP_Local>:<Puerto>/coordenadas -d "coordenadas=$coordenadas"
    echo "Coordenadas enviadas al servidor."
}

# Menú principal
while true; do
    echo "Seleccione una opción:"
    echo "1. Geolocalizar un número"
    echo "2. Salir"
    read -p "Opción: " opcion

    case $opcion in
        1) 
            obtener_geolocalizacion
            ;;
        2) 
            echo "Saliendo..."
            exit 0
            ;;
        *) 
            echo "Opción inválida. Intente de nuevo."
            ;;
    esac
done
