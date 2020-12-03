$(document).ready(function () {
    $("#file_input").change(function () {
        const f = this.files;
        const label = document.getElementById('file_label');
        if (label) {
            label.hidden = true;
        }
        const list = document.getElementById('file_list');
        if (list) {
            list.hidden = false;
        }
        const filesArr = Array.from(f);
        if (filesArr.length > 0) {
            renderFileList(filesArr);
        } else{
            label.hidden = false;
            list.hidden = true;
        }
    });
});

function renderFileList(files) {
    let fileMap = files.map((file, index) => {
        let suffix = "bytes";
        let size = file.size;
        if (size >= 1024 && size < 1024000) {
            suffix = "KB";
            size = Math.round(size / 1024 * 100) / 100;
        } else if (size >= 1024000) {
            suffix = "MB";
            size = Math.round(size / 1024000 * 100) / 100;
        }

        return `<li key="${index}">${
            file.name
        } <span class="file-size">${size} ${suffix}</span></li>`;
    });
    $("ul").html(fileMap);
}