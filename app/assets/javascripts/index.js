/**
 * Created by michaelheath on 2016-06-05.
 */

$(document).ready(function () {

    $("#select_country").change(function () {
        $("#select_destination").prop("disabled", false);
        $.ajax({
            url: "/destinations/getDestinationsByCountry", // this will be routed
            type: 'GET',
            data: {
                country_id: $("#select_country").val()
            },
            async: true,
            dataType: "json",
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert("Failed: "+ errorTextStatus+" ;"+error);
            },
            success: function(data){
                $("#select_destination").children().remove();
                $("#select_destination").append('<option value="0">Select Destination</option>');
                $.each(data, function (key,value){
                    $("#select_destination").append('<option value="'+ value[1] +'">'+ value[0] +'</option>')
                });
            }
        });


    })
    
    $("#select_destination").change(function () {
        $("#select_location").prop("disabled", false);
        $.ajax({
            url: "/locations/getLocationsByDestination", // this will be routed
            type: 'GET',
            data: {
                destination_id: $("#select_destination").val()
            },
            async: true,
            dataType: "json",
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert("Failed: "+ errorTextStatus+" ;"+error);
            },
            success: function(data){
                $("#select_location").children().remove();
                $("#select_location").append('<option value="0">Select Location</option>');
                $.each(data, function (key,value){
                    $("#select_location").append('<option value="'+ value[1] +'">'+ value[0] +'</option>')
                });
            }
        });
    })

    $("#select_location").change(function () {
        $("#more_location_id").val( $("#select_location").val()) ;
    })
    
    /*
    $('#destination_name').autocomplete({
        serviceUrl: '/destinations/autocomplete',
        transformResult: function(response) {
            return {
                suggestions: $.map($.parseJSON(response), function(dataItem) {
                    return { value: dataItem.value, data: dataItem.data };
                })
            };
        },
        onSelect: function (suggestion) {
            $('#destination_id').val(suggestion.data);
            $('#destination_name').val(suggestion.value);
            $("#destination_name").addClass("loadinggif");
            $('#search_form_dest').submit();
        }
    });
    */

    $('#hotel_name').autocomplete({
        serviceUrl: '/accommodations/autocomplete',
        transformResult: function(response) {
            return {
                suggestions: $.map($.parseJSON(response), function(dataItem) {
                    return { value: dataItem.value, data: dataItem.data };
                })
            };
        },
        onSelect: function (suggestion) {
            $('#hotel_id').val(suggestion.data);
            $('#hotel_name').val(suggestion.value);
            $('#search_form_hotel').submit();
        },
        onSearchComplete: function (query, suggestions) {
            $("#hotel_name").removeClass("loadinggif");
        },
        onSearchStart: function (query) {
            $("#hotel_name").addClass("loadinggif");
        }
    });
});



