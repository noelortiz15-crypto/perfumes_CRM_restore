-- =====================================================
-- SIMPLE ADMIN USER SETUP
-- =====================================================
-- Quick script to create admin profile after user creation
--
-- STEP 1: Go to Supabase Dashboard > Authentication > Users
-- STEP 2: Click "Add User" and create:
--         Email: admin@tiendaperfumes.com
--         Password: Admin@123456
--         Auto Confirm User: YES
-- 
-- STEP 3: After creating the user, copy the User ID (UUID)
-- STEP 4: Replace 'PASTE_USER_ID_HERE' below with the actual UUID
-- STEP 5: Run this script in SQL Editor
-- =====================================================

-- Updated to match correct schema with full_name instead of email/role
-- Create profile for admin user
-- REPLACE 'PASTE_USER_ID_HERE' with the actual user ID from Step 3
INSERT INTO public.profiles (id, full_name, avatar_url, created_at, updated_at)
VALUES (
  'PASTE_USER_ID_HERE'::uuid,  -- Replace this with actual user ID
  'Admin Tienda Perfumes',
  NULL,
  NOW(),
  NOW()
)
ON CONFLICT (id) DO UPDATE
SET 
  full_name = EXCLUDED.full_name,
  updated_at = NOW();

-- Verify the profile was created
SELECT 
  id, 
  full_name, 
  created_at 
FROM public.profiles 
WHERE full_name = 'Admin Tienda Perfumes';

-- =====================================================
-- EXPECTED OUTPUT:
-- Should show one row with your UUID and 'Admin Tienda Perfumes'
-- =====================================================
