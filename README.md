# money-map

## Checkstyle configuration
In order to configure pre-commit checkstyle checks, you need to:

1. *Install checkstyle distribution*
2. *Install pre-commit utility*
3. *Run set up hook scripts*

You can do it manually leveraging the

```sh
cd scripts
./setup-hooks.sh
```

or running the
```sh
scripts/project_init.sh
```
which is recommended

# Securtiy
Використовуємо Session-Based security with JWT механізмом для покращення надійності системи.
Флоу можна описати як наступним чином(happy path, user logged in):
1. Client(в нашому випадку frontend) надсилає запит до бекенду.
2. API Gateway перехоплює запит та направляє його до auth service.
3. auth service валідує запит на наявність `SESSIONID` cookie.
4. У випадку, якщо відсутній - перенаправляє на сторінку логіну із `originalRequest` параметром, щоб після логіну користувач був перенаправлений на бажану сторінку. У випадку, якщо `SESSIONID` присутній, сервіс витягує сесію із кешу Redis.
5. В кеші сесії зберігатимуться у форматі `SESSIONID: user_id`. Система звертається до бази даних та дістає користувача зі зазначеним `user_id`.
6. Система генерує JWT, який включатиме відомості про користувача, ролі, тощо. Система надсилає оригінальний запит з клієнту вже із токеном.
7. API Gateway направляє запит із токеном до Resource Server. Resource Server валідує структуру токену та проводить авторизацію.


## Визначення
**Client** - програма або система, яка взаємодіє із бекендом. В нашому випадку, клінєтом виступатиме frontend.
**API Gateway** - система, що виступає централізованою точкою входу до застосунку. Система відповідальна за load balancing, routing.
**Resource server** - система, що зберігає чутливу інформацію та основну бізнес логіку.