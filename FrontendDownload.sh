if [ ! -f GMO_Nachhilfeboerse.tar.gz ]; then
    curl -Lo GMO_Nachhilfeboerse.tar.gz 'https://github.com/PlisJan/GMONachhilfeboerse.Frontend/releases/latest/download/GMO_Nachhilfeboerse_Frontend.tar.gz'
    tar -xzvf GMO_Nachhilfeboerse.tar.gz
    rm -f GMO_Nachhilfeboerse.tar.gz
fi
