
function getPetInfo(evt) {
    console.log(evt)
    var pet_id = this.id;
    console.log("Pet ID is", pet_id)

    $.get("/pet.json", {'pet_id':pet_id},
        function(results) {
            console.log("Made it! Results are", results);
        var pet_id = results.id;
        var pet_desc = results.description;
        console.log(pet_desc);
        $('#div_' + pet_id).html(pet_desc);
                        }
);
}

$('.button').click(getPetInfo);

