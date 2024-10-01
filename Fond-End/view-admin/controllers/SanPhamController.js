window.SanPhamController = function ($scope,$http) {
    $scope.SanPham = [];
    // Hàm để lấy danh sách nhân viên
    function fetchData(url, target) {
        $http({
            method: 'GET',
            url: url
        }).then(function (response) {
            $scope[target] = response.data;
        }, function (error) {
            console.error('Error fetching data:', error);
        });
    }

    // Gọi hàm lấy dữ liệu khi controller được khởi tạo
    fetchData('http://localhost:8080/api/san_pham', 'SanPham');


    $scope.sanPhamMoi = {};

    // Hiển thị modal thêm sản phẩm
    $scope.hienThiModalThemSanPham = function () {
        $scope.sanPhamMoi = {}; // Reset form
        $('#themSanPhamModal').modal('show');
    };

    // Lưu sản phẩm mới
    $scope.luuSanPhamMoi = function () {
        // Kiểm tra tính hợp lệ của form (nếu cần)
        if ($scope.sanPhamMoi.ten && $scope.sanPhamMoi.giaBan) {
            $scope.danhSachSanPhamCT.push({
                sanPham: angular.copy($scope.sanPhamMoi),
                soLuongTon: 0,  // Giả định số lượng tồn ban đầu là 0
                loai: { ten: $scope.sanPhamMoi.loai },
                thuongHieu: { ten: "Thương hiệu A" }  // Bạn có thể cập nhật thông tin thương hiệu nếu cần
            });
            $('#themSanPhamModal').modal('hide');  // Ẩn modal sau khi lưu
        } else {
            alert("Vui lòng điền đầy đủ thông tin sản phẩm.");
        }
    };

    // Các hàm khác: chỉnh sửa sản phẩm, v.v.

}