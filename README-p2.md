#Read this file before Doing any thing

## Project name

> KhungLongCon_Shop (sell everything)

<hr>

### Some rule before coding for optimization teamwork

`PascalCase`

- Component (.tsx): UserManagement.tsx
- Model entity, class, interface, và các type còn lại (class CustomerViewModel, UserClass, CustomerDashboard)

`CamelCase`

- File .ts
- Tên các biến, và hàm bên trong 1 component.
- Hook: useTranslate, useState

`Kebab-case`

- Tên folder sẽ viết thường, nếu nhiều từ sẽ cách bằng dấu - `user-management`

`Nên đặt rõ ràng tên biến để tránh việc đọc vào khó hiểu`

    Bad:
        const abc = 60;
    Good:
        const minutes = 60;

`Tránh việc tạo ra các magic number`

    Bad:
        if(rule > 60)// 60 ???

    Good:
        const TIME_EXPIRE = 60;
        if(rule > TIME_EXPIRE)

`Hằng số`

- Các biến liên quan đến hằng số, đây là ngoại lệ, nên viết hoa hết và cách nhau = dấu \_ ví dụ: TIME_EXPIRE, DISCOUNT_PERCENT, LIMIT_RATE

`Nên xài const và let, hạn chế xài var trong typescript (liên quan đến scope của 1 biến)`

`Tránh đặt tên file tsx giống với tên folder`

`Tránh tự viết css liên quan đến vấn đề responsive ui:`

- Nên sử dụng component của MUI để làm
- Chỉ nên override các style của MUI.
