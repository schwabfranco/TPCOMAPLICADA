#!/bin/bash

# ================================
#  Script: backup_full.sh
#  Autor: Franco Schwab
#  Funcion: generar backups completos
# ================================

BACKUP_DIR="/backup_dir"
DATE=$(date +"%Y-%m-%d_%H-%M")

# ---- Ayuda ----
if [[ "$1" == "-help" ]]; then
    echo "Uso: backup_full.sh [opciones]"
    echo "Opciones:"
    echo "   -help     Muestra este mensaje"
    echo ""
    echo "El script genera backups de:"
    echo "   /www_dir  /backup_dir  /etc  /opt  /root  /proc/particion"
    exit 0
fi

echo "========== INICIANDO BACKUP =========="

# Crear archivo persistente /proc/particion
echo "Guardando particiones actuales..."
cat /proc/partitions > /proc/particion

# Crear archivos tar.gz
echo "Comprimiendo directorios..."

tar -czf $BACKUP_DIR/www_dir_$DATE.tar.gz /www_dir
tar -czf $BACKUP_DIR/backup_dir_$DATE.tar.gz /backup_dir
tar -czf $BACKUP_DIR/etc_$DATE.tar.gz /etc
tar -czf $BACKUP_DIR/opt_$DATE.tar.gz /opt
tar -czf $BACKUP_DIR/root_$DATE.tar.gz /root
tar -czf $BACKUP_DIR/proc_particion_$DATE.tar.gz /proc/particion

echo "Backups creados correctamente en $BACKUP_DIR"
echo "=========================================="
