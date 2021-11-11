[![Contributors][contributors-shield]][contributors-url]
[![Commits][commits-shield]][commits-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/DaniloLira/Liste">
    <img src="assets/Logo.png" alt="Logo" width="180" height="180">
  </a>

  <h3 align="center">Liste</h3>

  <p align="center">
    Liste é um app para anotar suas tarefas de forma a respeitar sua rotina e suas necessidades
    <br />
    <a href="https://github.com/DaniloLira/Liste"><strong>Explore a documentação »</strong></a>
    <br />
    <br />
    <a href="https://github.com/DaniloLira/Liste">TestFlight</a>
    ·
    <a href="https://github.com/DaniloLira/Liste">Reporte Bug</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Tabela de conteúdo

* [Sobre o projeto](#sobre-o-projeto)
* [Tecnologias utilizadas](#tecnologias-utilizadas)
* [Gitflow](#gitflow)


<!-- ABOUT THE PROJECT -->
## Sobre o projeto
O Liste é um aplicativo desenvolvido para iPhone com objetivo de gerenciar as atividades diárias de forma a respeitar o tempo disponível.


### Tecnologias utilizadas
Aqui listamos as tecnologias utilizadas para a construção deste projeto
* [Swift](https://swift.org/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/DaniloLira/Liste.svg?style=flat-square
[contributors-url]: https://img.shields.io/github/contributors/DaniloLira/Liste
[forks-shield]: https://img.shields.io/github/forks/DaniloLira/Liste.svg?style=flat-square
[forks-url]: https://img.shields.io/github/forks/DaniloLira/Liste
[commits-shield]: https://img.shields.io/github/last-commit/DaniloLira/Liste.svg?style=flat-square
[commits-url]: https://img.shields.io/github/last-commit/DaniloLira/Liste
[stars-shield]: https://img.shields.io/github/stars/DaniloLira/Liste.svg?style=flat-square
[stars-url]: https://img.shields.io/github/stars/DaniloLira/Liste
[issues-shield]: https://img.shields.io/github/issues/DaniloLira/Liste.svg?style=flat-square
[issues-url]: https://img.shields.io/github/issues/DaniloLira/Liste
[product-screenshot]: images/screenshot.png

<!-- Git Flow -->
## Git Flow

### Add new Feature or fix a Bug

1. Create your Feature or Fix Branch
  * `git checkout -b feature/AmazingFeature`
  * `git checkout -b fix/AmazingFix`
  * `git checkout -b test/AmazingTest`
2. Commit your Changes
  * `git commit -m 'Feature(AmazingFeature): Add some AmazingFeature`
  * `git commit -m 'Fix(AmazingFix): Fixes a bug`
  * `git commit -m 'Test(AmazingFeature): UI Button Test
3. Push to the Branch
  * `git push origin feature/AmazingFeature`
  * `git push origin fix/AmazingFix`
4. Open a Pull Request in Github's Pull request tab and fill it with the above Pull Request Template.
5. If the Pull Request is not able to merge automatically do the following steps while on your branch:
```sh
git pull develop
```
6. Solves conflicts in Xcode, and commit your changes
7. Add reviewers to your Pull Request and wait for approval.

## Pull Request Template
```sh
### Issue Name
**What I did:**

- First thing I did...

- Second thing I did...

**How to test:**

- Brief notes on how to check if the feature works correctly.
```
