/*! Validaciones Custom para jQuery Validation Plugin - v1.19.5 - 2024-01-18
*/

$( document ).ready(function() {


    /**
     * Metodo aliasformat - formato regex para campo Alias
     */
    jQuery.validator.addMethod("aliasformat", function(value, element) {
        return this.optional( element ) || /^(?=.*?\d)(?=.*?[a-zA-Z])[a-zA-Z\d]+$/.test( value );
    }, 'El alias solo acepta letras y n&uacute;meros.');

    /**
     * Metodo rutformat - Formato regex y validacion de Digito Verificador campo RUT
     */
    jQuery.validator.addMethod("rutformat", function(value, element) {

        if (this.optional( element ))
            return this.optional( element );
        
        if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( value ))
            return false;

        let tmp 	= value.split('-');
        let digv	= tmp[1]; 
        let rut 	= parseInt(tmp[0]);

        let digVerCalculado = "";

        let M=0, S=1;
        for (; rut; rut=Math.floor(rut / 10))
        {
            S = (S + rut %10 * (9 - M++ %6)) %11;
        }
            
        digVerCalculado = S ? S-1 : 'K';
        
        return (digVerCalculado.toString() == digv.toString().toUpperCase());

    }, 'Debe ingresar un RUT v&aacute;lido en formato (9999999-9).');

});