# Shizapret-Mod

Расширенная модификация, предназначенная для обхода большего количества блокировок со стороны Роскомнадзора.

## Возможности

- Обход блокировок миллионов заблокированных доменов (1.5M+ записей в списке)
- Поддержка IP-адресов заблокированных ресурсов (30K+ CIDR-записей)
- Работа с Discord (текст, голосовые каналы, медиа, STUN)
- Обход блокировок YouTube и Google (включая QUIC)
- Поддержка Roblox (UDP 49152-65535)
- Поддержка WhatsApp
- Поддержка Amazon, SoundCloud, Nexus Mods, Speedtest и десятков других сервисов
- Game Filter для дополнительных игровых портов
- Пользовательские списки для кастомизации

## Варианты запуска

| Файл | Описание |
|------|----------|
| `shizapret.bat` | Основной скрипт (на основе ALT11 из Flowseal/zapret-discord-youtube). Стратегия `fake,fakedsplit` для TCP и `fake` для UDP. Поддерживает пользовательские списки и дополнительные домены (AdGuard, Windscribe, SoundCloud, Nexus Mods, Roblox, WhatsApp и др.). |
| `shizapret (alt).bat` | Альтернатива (на основе ALT9). Стратегия `hostfakesplit` с подменой хоста для основных протоколов. Поддерживает пользовательские списки. |
| `shizapret (filter all).bat` | Версия `shizapret (alt).bat` с фильтрацией **всех** доменов (исключая только список исключений). Без привязки к конкретным доменам. |
| `shizapret (alt) (filter all).bat` | Версия `shizapret.bat` с фильтрацией **всех** доменов. Максимальный охват без привязки к конкретным доменам. |

## Структура файлов

```
Shizapret-Mod/
├── lists/
│   ├── ipset-all.txt            — IP-адреса заблокированных ресурсов (30K+)
│   ├── ipset-exclude.txt        — IP-адреса для исключения
│   ├── ipset-exclude-user.txt   — Пользовательские IP-исключения
│   ├── list-general.txt         — Домены заблокированных ресурсов (1.5M+)
│   ├── list-general-user.txt    — Пользовательский список доменов
│   ├── list-exclude.txt         — Домены для исключения
│   ├── list-exclude-user.txt    — Пользовательские доменные исключения
│   └── list-google.txt          — Домены Google/YouTube
├── shizapret.bat                — Основной скрипт
├── shizapret (alt).bat          — Альтернатива
├── shizapret (filter all).bat   — Фильтрация всех доменов (alt)
└── shizapret (alt) (filter all).bat — Фильтрация всех доменов (основной)
```

## Используемые DPI-стратегии

- **fake,fakedsplit** — отправка поддельных пакетов с разбиением по SLD
- **fake** — отправка поддельных пакетов
- **hostfakesplit** — подмена имени хоста при разбиении пакетов

## Пользовательские списки

Для добавления своих доменов отредактируйте файлы:
- `list-general-user.txt` — домены, к которым нужно обеспечить доступ
- `list-exclude-user.txt` — домены, которые нужно исключить из обработки
- `ipset-exclude-user.txt` — IP-адреса для исключения

## Исходники и авторы

Мод создан на основе следующих проектов:

- [Flowseal/zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube) — оригинальные стратегии обхода блокировок Discord и YouTube
- [bol-van/zapret](https://github.com/bol-van/zapret) — ядро zapret и список заблокированных ресурсов (rulist)
- [sch-izo/shizapret](https://github.com/sch-izo/shizapret) — форк с автообновлением и расширенным обходом блокировок
- [peachoff/Zapret-Hub-Mods](https://github.com/peachoff) — сборка и пакетирование мода
