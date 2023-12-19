
const EMAIL = "20130266@st.hcmuaf.edu.vn";
const PASSWORD = "123456";
const WARD = "90737";
const DISTRICT = "3695";
axios.post('http://140.238.54.136/api/auth/login', {
    email: EMAIL,
    password: PASSWORD
})
    .then(response => {
        callProvince(response.data.access_token);
    });

var callProvince = (access_token) => {
    return axios.get(`http://140.238.54.136/api/province?token=${access_token}`).then((response) => {
        renderDataProvince(response.data.original.data,"province");
    });
}

var renderDataProvince = (array, select) => {
    let row = ' <option disable value="">chọn</option>';
    array.forEach(element => {
        row += `<option value="${element.ProvinceID}">${element.ProvinceName}</option>`
    });
    document.querySelector("#" + select).innerHTML = row
}

$("#province").change(() => {
    axios.post('http://140.238.54.136/api/auth/login', {
        email: EMAIL,
        password: PASSWORD
    })
        .then(response => {
            callDistrict(response.data.access_token);
        });
    var callDistrict = (access_token) => {
        return axios.get(`http://140.238.54.136/api/district?token=${access_token}`, {
            params: {
                provinceID: $("#province").val()
            }
        }).then((response) => {
            renderDataDistrict(response.data.original.data,"district");
        });
    }
});
var renderDataDistrict = (array, select) => {
    let row = ' <option disable value="">chọn</option>';
    array.forEach(element => {
        row += `<option value="${element.DistrictID}">${element.DistrictName}</option>`
    });
    document.querySelector("#" + select).innerHTML = row
}

$("#district").change(() => {
    axios.post('http://140.238.54.136/api/auth/login', {
        email: EMAIL,
        password: PASSWORD
    })
        .then(response => {
            callWard(response.data.access_token);
        });
    var callWard = (access_token) => {
        return axios.get(`http://140.238.54.136/api/ward?token=${access_token}`, {
            params: {
                districtID: $("#district").val()
            }
        }).then((response) => {
            renderDataWard(response.data.original.data,"ward");
        });
    }
    var renderDataWard = (array, select) => {
        let row = ' <option disable value="">chọn</option>';
        array.forEach(element => {
            row += `<option value="${element.WardCode}">${element.WardName}</option>`
        });
        document.querySelector("#" + select).innerHTML = row
    }
})

function showTable() {
    document.getElementById("myTable").style.display = "block";
    document.getElementById("overlayT").classList.add("show");

}
function hideTable() {
    document.getElementById("myTable").style.display = "none";
    document.getElementById("overlayT").classList.remove("show");
    document.getElementById("error").innerHTML = "";
}

var soNha = document.getElementById("soNha").value;
function validateInput() {
    if ($("#district").val() != "" && $("#province").val() != "" &&
        $("#ward").val() != "" && $("#soNha").val() != "") {
        document.getElementById("address").value  = $("#soNha").val() + ", " + $("#ward option:selected").text() +
            ", " + $("#district option:selected").text() + ", " +
            $("#province option:selected").text();
            fee($("#ward option:selected").val(), $("#district option:selected").val());
        hideTable();
    }
    else {
        document.getElementById('error').innerHTML = 'Vui lòng chọn đủ thông tin địa chỉ';
    }
}

function validateInput() {
    if ($("#district").val() != "" && $("#province").val() != "" &&
        $("#ward").val() != "" && $("#soNha").val() != "") {
        document.getElementById("address").value  = $("#soNha").val() + ", " + $("#ward option:selected").text() +
            ", " + $("#district option:selected").text() + ", " +
            $("#province option:selected").text();
        hideTable();
    }
    else {
        document.getElementById('error').innerHTML = 'Vui lòng chọn đủ thông tin địa chỉ';
    }
}