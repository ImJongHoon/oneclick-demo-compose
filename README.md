# OneClick compose demo

OneClick의 DB 배포(F-6) 시연용 앱입니다. 방문할 때마다 Postgres에 기록하고 총 방문 수를 보여 줍니다.

- 일부러 `Dockerfile`과 `compose.yaml`이 없습니다. OneClick이 `package.json`의 `pg` 의존성을 보고 Postgres가 필요한 앱임을 알아내, compose 파일은 템플릿으로, Dockerfile은 AI로 만들어 설정 PR에 넣습니다.
- DB 비밀번호는 OneClick이 만들어 암호화된 환경변수에 저장합니다. 저장소에는 들어가지 않습니다.
- 재배포·롤백해도 방문 수가 이어지면 "데이터 보존 + 무중단 교체"가 동작하는 것입니다.
- 테이블은 앱이 시작할 때 직접 만듭니다 (`CREATE TABLE IF NOT EXISTS`).
- 응답 헤더 `X-App-Version`에 버전을 넣습니다 (OneClick 측정 스크립트가 읽음).
