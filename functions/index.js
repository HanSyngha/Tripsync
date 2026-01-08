const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

/**
 * Creates a Firebase custom token for Kakao login
 * Called from Flutter app after Kakao OAuth authentication
 */
exports.createKakaoToken = functions.https.onCall(async (data, context) => {
  const {kakaoId, email, displayName, photoUrl} = data;

  console.log("createKakaoToken called with:", {kakaoId, email, displayName});

  if (!kakaoId) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "Kakao ID is required",
    );
  }

  // Create a unique UID for this Kakao user
  const uid = `kakao:${kakaoId}`;

  try {
    // Try to get existing user
    let userRecord;
    try {
      userRecord = await admin.auth().getUser(uid);
      console.log("Existing user found:", uid);
    } catch (error) {
      if (error.code === "auth/user-not-found") {
        // Create new user
        console.log("Creating new user:", uid);
        userRecord = await admin.auth().createUser({
          uid: uid,
          email: email || undefined,
          displayName: displayName || "Kakao User",
          photoURL: photoUrl || undefined,
        });
      } else {
        throw error;
      }
    }

    // Update user info if changed
    const updateData = {};
    if (displayName && userRecord.displayName !== displayName) {
      updateData.displayName = displayName;
    }
    if (photoUrl && userRecord.photoURL !== photoUrl) {
      updateData.photoURL = photoUrl;
    }
    if (Object.keys(updateData).length > 0) {
      await admin.auth().updateUser(uid, updateData);
    }

    // Create custom token
    const customToken = await admin.auth().createCustomToken(uid);
    console.log("Custom token created for:", uid);

    return {token: customToken};
  } catch (error) {
    console.error("Error creating Kakao token:", error);
    throw new functions.https.HttpsError(
        "internal",
        "Failed to create custom token",
        error.message,
    );
  }
});

/**
 * Creates a Firebase custom token for Naver login
 * Called from Flutter app after Naver OAuth authentication
 */
exports.createNaverToken = functions.https.onCall(async (data, context) => {
  const {naverId, email, displayName, photoUrl} = data;

  console.log("createNaverToken called with:", {naverId, email, displayName});

  if (!naverId) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "Naver ID is required",
    );
  }

  // Create a unique UID for this Naver user
  const uid = `naver:${naverId}`;

  try {
    // Try to get existing user
    let userRecord;
    try {
      userRecord = await admin.auth().getUser(uid);
      console.log("Existing user found:", uid);
    } catch (error) {
      if (error.code === "auth/user-not-found") {
        // Create new user
        console.log("Creating new user:", uid);
        userRecord = await admin.auth().createUser({
          uid: uid,
          email: email || undefined,
          displayName: displayName || "Naver User",
          photoURL: photoUrl || undefined,
        });
      } else {
        throw error;
      }
    }

    // Update user info if changed
    const updateData = {};
    if (displayName && userRecord.displayName !== displayName) {
      updateData.displayName = displayName;
    }
    if (photoUrl && userRecord.photoURL !== photoUrl) {
      updateData.photoURL = photoUrl;
    }
    if (Object.keys(updateData).length > 0) {
      await admin.auth().updateUser(uid, updateData);
    }

    // Create custom token
    const customToken = await admin.auth().createCustomToken(uid);
    console.log("Custom token created for:", uid);

    return {token: customToken};
  } catch (error) {
    console.error("Error creating Naver token:", error);
    throw new functions.https.HttpsError(
        "internal",
        "Failed to create custom token",
        error.message,
    );
  }
});
