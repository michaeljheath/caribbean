/**
 * Created by michaelheath on 2016-06-05.
 */

// set the country id for more results after loadMoreResults
$(document).ready(function () {
    $(this).ajaxSuccess( function(event, jqXHR, ajaxInfo, data) {
        $("#more_country_id").val($("#country_id").val()) ;
        $("#country_name").removeClass("loadinggif");
    })

    // set the country id for more results after the searchByCountry call
    $("#load_form").submit(function( event ) {
        $("#more_country_id").val($("#country_id").val()) ;
    });


    $('#country_name').autocomplete({
        serviceUrl: '/countries/autocomplete',
        transformResult: function(response) {
            return {
                suggestions: $.map($.parseJSON(response), function(dataItem) {
                    return { value: dataItem.value, data: dataItem.data };
                })
            };
        },
        onSelect: function (suggestion) {
            $('#country_id').val(suggestion.data);
            $('#country_name').val(suggestion.value);
            $("#country_name").addClass("loadinggif");
            $('#search_form_country').submit();
        }
    });

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



