//Antes de crear el ComboBox
var ComboBox_BeforeRender = function (combobox, opciones) {
    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        combobox.cls = 'cajaCombobox cajaComboboxFocus';
    }
    else {
        combobox.cls = 'bancomerCombobox bancomerComboboxFocus';
    }
};

//Antes de crear el la lista del ComboBox
var ListConfig_BeforeRender = function (boundlist, opciones) {
    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        boundlist.cls = 'cajaComboboxLista';
    }
    else {
        boundlist.cls = 'bancomerComboboxLista';
    }
};

//Método para calcular la edad en base a la fecha de nacimiento
var CalcularFechaNacimiento = function (datefield, fecha) {
    fecha = App.dfFechaNacimiento.getValue();

    //1. Calculo la fecha de hoy
    hoy = new Date();

    //2. Calculo la fecha que recibo y la descompongo en un array 
    var array_fecha = (fecha.getDate() + "/" + (fecha.getMonth() + 1) + "/" + fecha.getFullYear()).split("/");

    //3. Si el array no tiene tres partes, la fecha es incorrecta 
    if (array_fecha.length != 3)
        return false;

    //4. Compruebo que ano, mes, dia son correctos 
    var ano;
    ano = parseInt(array_fecha[2]);
    if (isNaN(ano))
        return false;

    var mes;
    mes = parseInt(array_fecha[1]);
    if (isNaN(mes))
        return false;

    var dia;
    dia = parseInt(array_fecha[0]);
    if (isNaN(dia))
        return false;

    //5. Si el año de la fecha que recibo solo tiene 2 cifras hay que cambiarlo a 4 
    if (ano <= 99)
        ano += 1900;

    //6. Resto los años de las dos fechas 
    var edad = hoy.getFullYear() - ano - 1; //-1 porque no se si ha cumplido años ya este año

    //7. Si resto los meses y me da menor que 0 entonces no ha cumplido años. Si da mayor si ha cumplido 
    if (hoy.getMonth() + 1 - mes < 0) { //+ 1 porque los meses empiezan en 0
        App.txtfEdad.setValue(edad + ' años');
        return true;
    }
    if (hoy.getMonth() + 1 - mes > 0) {
        App.txtfEdad.setValue((edad + 1) + ' años');
        return true;
    }

    //8. Entonces es que eran iguales. miro los dias 
    //Si resto los dias y me da menor que 0 entonces no ha cumplido años. Si da mayor o igual si ha cumplido 
    if (hoy.getUTCDate() - dia >= 0) {
        App.txtfEdad.setValue((edad + 1) + ' años');
        return true;
    }

    App.txtfEdad.setValue(edad + ' años');
};