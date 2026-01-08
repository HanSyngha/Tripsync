# TripSync 앱 설정 가이드

이 가이드를 따라 필요한 API 키와 설정을 완료하세요.

---

## 1. Firebase 설정

### Step 1: Firebase 프로젝트 생성
1. [Firebase Console](https://console.firebase.google.com/) 접속
2. "프로젝트 추가" 클릭
3. 프로젝트 이름: `tripsync` (또는 원하는 이름)
4. Google Analytics 활성화 (권장)
5. 프로젝트 생성 완료

### Step 2: Android 앱 등록
1. Firebase Console > 프로젝트 설정 > 앱 추가 > Android
2. 패키지 이름: `com.yourcompany.tripsync` (나중에 변경 가능)
3. 앱 닉네임: TripSync
4. SHA-1 인증서 지문 추가 (Google 로그인에 필요):
   ```bash
   # Debug용 SHA-1 확인
   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
   ```
5. `google-services.json` 다운로드
6. 다운로드한 파일을 `android/app/` 폴더에 저장

### Step 3: iOS 앱 등록
1. Firebase Console > 프로젝트 설정 > 앱 추가 > iOS
2. 번들 ID: `com.yourcompany.tripsync`
3. 앱 닉네임: TripSync
4. `GoogleService-Info.plist` 다운로드
5. 다운로드한 파일을 `ios/Runner/` 폴더에 저장

### Step 4: Firebase 서비스 활성화

#### Authentication (인증)
1. Firebase Console > Authentication > 시작하기
2. Sign-in method 탭에서 다음 활성화:
   - [x] Google
   - [ ] Apple (나중에 - Apple Developer 계정 필요)
3. Kakao, Naver는 Firebase에서 직접 지원하지 않으므로 Custom Token 사용

#### Cloud Firestore (데이터베이스)
1. Firebase Console > Firestore Database > 데이터베이스 만들기
2. 프로덕션 모드로 시작
3. 위치: `asia-northeast3` (서울) 권장

#### Storage (파일 저장소)
1. Firebase Console > Storage > 시작하기
2. 위치: Firestore와 동일하게 설정

#### Cloud Messaging (푸시 알림)
1. Firebase Console > 프로젝트 설정 > Cloud Messaging
2. **Android**: 자동 설정됨 (추가 작업 없음)
3. **iOS**: 나중에 설정 (Apple Developer 계정 필요) - 아래 "나중에 설정" 섹션 참고

---

## 2. Google Maps Platform 설정

### Step 1: Google Cloud Console 프로젝트
1. [Google Cloud Console](https://console.cloud.google.com/) 접속
2. Firebase 프로젝트와 연결된 프로젝트 선택 (자동 생성됨)

### Step 2: API 활성화
1. API 및 서비스 > 라이브러리에서 다음 API 활성화:
   - [x] **Maps SDK for Android**
   - [x] **Maps SDK for iOS**
   - [x] **Directions API** (경로 표시용)
   - [x] **Places API** (장소 검색용)
   - [x] **Geocoding API** (주소 변환용)

### Step 3: API 키 생성
1. API 및 서비스 > 사용자 인증 정보 > 사용자 인증 정보 만들기 > API 키
2. **Android용 키**:
   - 애플리케이션 제한사항: Android 앱
   - 패키지 이름 및 SHA-1 추가
3. **iOS용 키**:
   - 애플리케이션 제한사항: iOS 앱
   - 번들 ID 추가
4. **API 제한** (보안): 위에서 활성화한 API만 선택

---

## 3. 소셜 로그인 설정

### Google Sign-In
- Firebase Authentication에서 이미 설정됨
- `google-services.json` / `GoogleService-Info.plist`에 포함

### Apple Sign-In (⏸️ 나중에)
> Apple Developer 계정($99/년) 필요 - 아래 "나중에 설정" 섹션 참고

### Kakao 로그인 (2025.12 개편 반영 - 최신)

> ⚠️ 2025년 12월 카카오 개발자 콘솔이 대폭 개편되었습니다.

#### Step 1: 앱 등록
1. [Kakao Developers](https://developers.kakao.com/) 접속
2. 로그인 후 "내 애플리케이션" 클릭
3. "애플리케이션 추가하기" 클릭
4. 앱 정보 입력:
   - 앱 이름: TripSync
   - 사업자명: 본인 이름 또는 회사명
5. 저장 후 생성된 앱 클릭

#### Step 2: 앱 키 확인 (새로운 구조!)
> 2026년부터 **플랫폼당 최대 5개 키** 생성 가능

1. "앱 > 플랫폼 키" 메뉴에서 확인
2. 키 종류:
   - **JavaScript 키**: 웹에서 사용
   - **REST API 키**: 서버에서 사용
   - **네이티브 앱 키**: Android/iOS 앱에서 사용 ← **이거 사용**
   - **Admin 키**: 서버 관리용 (절대 노출 금지)

3. `credentials.env`에 기록:
   - 네이티브 앱 키
   - REST API 키

#### Step 3: 플랫폼 정보 등록 (변경된 위치!)
> 기존: `앱 설정 > 플랫폼`
> **신규: `앱 > 플랫폼 키 > 네이티브 앱 키` 하위에서 설정**

1. "앱" > "플랫폼 키" 메뉴
2. 사용할 **네이티브 앱 키** 클릭
3. **Android 플랫폼 추가**:
   - 패키지명: `com.yourcompany.tripsync`
   - 키 해시 추가:
   ```bash
   # Debug 키 해시 생성
   keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -keypass android | openssl sha1 -binary | openssl base64
   ```
4. **iOS 플랫폼 추가**:
   - 번들 ID: `com.yourcompany.tripsync`

#### Step 4: 카카오 로그인 활성화
1. "제품 설정" > "카카오 로그인" 메뉴
2. **활성화 설정**: ON
3. **OpenID Connect 활성화 설정**: ON (권장)

#### Step 5: Redirect URI (Native App은 콘솔 등록 불필요!)
> ⚠️ **중요 변경사항**: Native App(Flutter/Android/iOS)은 콘솔에 Redirect URI 등록이 **불필요**합니다!

**Native App (Flutter)**:
- 콘솔 설정 ❌ 건너뛰기
- `AndroidManifest.xml`에서 설정 ✅ (Flutter 프로젝트 생성 시 자동 추가됨)

**웹 백엔드가 있는 경우만**:
- 콘솔 > 제품 설정 > 카카오 로그인 > Redirect URI에 등록:
  ```
  https://yourdomain.com/auth/kakao/callback
  ```

> 참고: `kakao{NATIVE_APP_KEY}://oauth` 형식은 커스텀 스킴이라 콘솔에서 "유효하지 않은 URL" 에러가 발생합니다. 이건 정상입니다!

#### Step 6: 동의 항목 설정
1. "제품 설정" > "카카오 로그인" > "동의항목"
2. 필수 항목 설정:
   - 닉네임: 필수 동의
   - 프로필 사진: 선택 동의

#### Step 7: 팀 멤버 등록 (테스트용)
1. "앱 설정" > "팀 관리"
2. 테스트할 카카오 계정 추가 (앱 검수 전까지 팀원만 로그인 가능)

#### Step 8: 제품 링크 관리 (신규 메뉴)
> 앱 설치 유도 링크 등 관리

1. "앱" > "제품 링크 관리" 메뉴
2. 필요시 마켓 URL 등록 (출시 후)

#### Kakao API 엔드포인트 (참고용)
```
# 토큰 발급
POST https://kauth.kakao.com/oauth/token

# 사용자 정보 조회
GET https://kapi.kakao.com/v2/user/me

# 로그아웃
POST https://kapi.kakao.com/v1/user/logout
```

---

### Naver 로그인 (상세 가이드)

> ℹ️ **배포 전에도 네이버 로그인 테스트 가능!** Debug 인증서로 개발 중 테스트할 수 있습니다.

#### Step 1: 앱 등록
1. [Naver Developers](https://developers.naver.com/) 접속
2. 로그인 후 "Application" > "애플리케이션 등록" 클릭
3. 약관 동의

#### Step 2: 애플리케이션 정보 입력
1. **애플리케이션 이름**: TripSync
2. **사용 API**: "네아로 (네이버 아이디로 로그인)" 선택
3. **제공 정보 선택**:
   - 회원이름: 필수
   - 이메일: 필수
   - 프로필 사진: 추가 (선택)
   - 별명: 추가 (선택)

#### Step 3: 로그인 오픈 API 서비스 환경

**Android 환경 추가**:
1. "서비스 환경 추가" > "Android" 클릭
2. 설정:
   - **다운로드 URL**: 아무 값이나 입력 (필수 필드)
     - 개발 중: `https://play.google.com/store` (임시)
     - 배포 후: `market://details?id=com.yourcompany.tripsync`
   - **패키지 이름**: `com.yourcompany.tripsync`

> ⚠️ 다운로드 URL은 네이버 로그인 SDK와 직접 연관 없음! 플레이스토어 링크일 뿐입니다.

**iOS 환경 추가** (나중에 - Apple 계정 필요):
1. "서비스 환경 추가" > "iOS" 클릭
2. 설정:
   - 다운로드 URL: 앱스토어 URL (배포 후)
   - URL Scheme: `tripsync`

#### Step 4: 클라이언트 정보 확인 (credentials.env에 기록)
1. 등록 완료 후 "애플리케이션 정보"에서 확인:
   - **Client ID**: 앱에서 사용
   - **Client Secret**: 앱에서 사용

#### Step 5: 개발/배포 단계별 테스트 방법

| 단계 | 방법 |
|------|------|
| **개발 중** | Debug keystore로 에뮬레이터/실기기 테스트 |
| **배포 준비** | Google Play Internal Testing 업로드 → 릴리스 인증서로 테스트 |
| **배포 후** | 프로덕션 릴리스 |

> 💡 **권장**: Internal Testing에서 네이버 로그인 완벽 검증 후 정식 배포!

#### Naver API 엔드포인트 (참고용)
```
# 토큰 발급
POST https://nid.naver.com/oauth2.0/token

# 사용자 정보 조회
GET https://openapi.naver.com/v1/nid/me

# 토큰 갱신
POST https://nid.naver.com/oauth2.0/token (grant_type=refresh_token)
```

---

### 소셜 로그인 iOS 추가 설정 (중요!)

#### Info.plist에 URL Scheme 등록 필요
앱 개발 시 `ios/Runner/Info.plist`에 다음 설정이 필요합니다:

```xml
<!-- Kakao -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>kakao{NATIVE_APP_KEY}</string>
        </array>
    </dict>
</array>

<key>LSApplicationQueriesSchemes</key>
<array>
    <string>kakaokompassauth</string>
    <string>kakaolink</string>
    <string>kakaoplus</string>
</array>

<!-- Naver -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>tripsync</string>
        </array>
    </dict>
</array>

<key>LSApplicationQueriesSchemes</key>
<array>
    <string>naversearchapp</string>
    <string>naversearchthirdlogin</string>
</array>
```

(이 설정은 Flutter 프로젝트 생성 시 자동으로 추가해드립니다)

---

## 4. 비용 관련 참고사항

### Firebase (무료 플랜 - Spark)
- Authentication: 무제한
- Firestore: 1GB 저장, 50K 읽기/일, 20K 쓰기/일
- Storage: 5GB
- FCM: 무제한

### Google Maps Platform
- 월 $200 무료 크레딧 제공
- Maps SDK: 무제한 (모바일)
- Directions API: 1000회/$5
- Places API: 1000회/$17

---

## 설정 완료 체크리스트

아래 체크리스트를 확인하며 진행하세요:

### Firebase (필수)
- [ ] Firebase 프로젝트 생성
- [ ] Android 앱 등록 및 `google-services.json` 다운로드
- [ ] iOS 앱 등록 및 `GoogleService-Info.plist` 다운로드
- [ ] Firebase Authentication 활성화 (Google만 - Apple은 나중에)
- [ ] Cloud Firestore 생성 (asia-northeast3 리전)
- [ ] Firebase Storage 생성

### Google Maps (필수)
- [ ] Maps SDK for Android 활성화
- [ ] Maps SDK for iOS 활성화
- [ ] Directions API 활성화
- [ ] Places API 활성화
- [ ] Geocoding API 활성화
- [ ] Android용 API 키 생성
- [ ] iOS용 API 키 생성

### Kakao 로그인 (필수)
- [ ] Kakao Developers 앱 등록
- [ ] 네이티브 앱 키 확인 → `credentials.env`에 기록
- [ ] REST API 키 확인 → `credentials.env`에 기록
- [ ] Android 플랫폼 등록 (패키지명, 키 해시)
- [ ] iOS 플랫폼 등록 (번들 ID)
- [ ] 카카오 로그인 활성화
- [ ] 동의항목 설정
- [ ] 팀 멤버 등록 (테스트 계정)

### Naver 로그인 (필수)
- [ ] Naver Developers 앱 등록
- [ ] Client ID 확인 → `credentials.env`에 기록
- [ ] Client Secret 확인 → `credentials.env`에 기록
- [ ] Android 서비스 환경 등록
- [ ] iOS 서비스 환경 등록
- [ ] Callback URL 설정

### credentials.env 기록 완료
- [ ] FIREBASE_PROJECT_ID
- [ ] GOOGLE_MAPS_API_KEY_ANDROID
- [ ] GOOGLE_MAPS_API_KEY_IOS
- [ ] KAKAO_NATIVE_APP_KEY
- [ ] KAKAO_REST_API_KEY
- [ ] KAKAO_KEY_HASH (Debug)
- [ ] NAVER_CLIENT_ID
- [ ] NAVER_CLIENT_SECRET

---

## 5. 나중에 설정 (Apple Developer 계정 생성 후)

> 아래 항목들은 Apple Developer 계정($99/년)이 있어야 설정 가능합니다.
> **코드는 미리 준비되어 있으므로**, 계정 생성 후 아래 설정만 완료하면 됩니다.

### Apple Sign-In 설정

#### Step 1: App ID 생성
1. [Apple Developer Console](https://developer.apple.com/) 접속
2. Certificates, Identifiers & Profiles > Identifiers
3. "+" 버튼 > App IDs > App 선택
4. Description: TripSync
5. Bundle ID: `com.yourcompany.tripsync` (Explicit)
6. Capabilities에서 "Sign In with Apple" 체크
7. Continue > Register

#### Step 2: Service ID 생성 (웹/Firebase용)
1. Identifiers > "+" 버튼 > Services IDs
2. Description: TripSync Login
3. Identifier: `com.yourcompany.tripsync.service`
4. Continue > Register
5. 생성된 Service ID 클릭 > "Sign In with Apple" 체크
6. Configure 클릭:
   - Primary App ID: 위에서 만든 App ID 선택
   - Domains: `tripsync-xxxxx.firebaseapp.com` (Firebase 도메인)
   - Return URLs: `https://tripsync-xxxxx.firebaseapp.com/__/auth/handler`

#### Step 3: Firebase에 Apple 로그인 활성화
1. Firebase Console > Authentication > Sign-in method
2. Apple 클릭 > 사용 설정
3. Service ID 입력: `com.yourcompany.tripsync.service`
4. Apple Team ID 입력 (Apple Developer 계정에서 확인)

### iOS 푸시 알림 (APNs) 설정

#### Step 1: APNs 키 생성
1. Apple Developer Console > Keys > "+" 버튼
2. Key Name: TripSync Push Key
3. "Apple Push Notifications service (APNs)" 체크
4. Continue > Register
5. `.p8` 파일 다운로드 (**한 번만 다운로드 가능! 잘 보관**)
6. **Key ID** 메모 (10자리)

#### Step 2: Firebase에 APNs 키 업로드
1. Firebase Console > 프로젝트 설정 > Cloud Messaging
2. iOS 앱 구성 섹션에서 "APNs 인증 키" 업로드
3. 입력 정보:
   - APNs 인증 키: `.p8` 파일 업로드
   - 키 ID: 위에서 메모한 10자리
   - 팀 ID: Apple Developer 계정의 Team ID

### Apple 설정 체크리스트
- [ ] Apple Developer 계정 생성 ($99/년)
- [ ] App ID 생성 (Sign In with Apple 활성화)
- [ ] Service ID 생성 및 구성
- [ ] Firebase에 Apple Sign-In 활성화
- [ ] APNs 키 생성 (.p8 파일)
- [ ] Firebase에 APNs 키 업로드
- [ ] credentials.env에 APPLE_TEAM_ID, APPLE_SERVICE_ID 기록
