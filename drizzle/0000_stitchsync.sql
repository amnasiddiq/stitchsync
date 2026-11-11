CREATE TABLE `profiles` (
  `id` text PRIMARY KEY NOT NULL,
  `email` text NOT NULL,
  `name` text NOT NULL,
  `role` text NOT NULL CHECK (`role` IN ('Customer','Brand / Supplier','Tailor','Delivery Partner','Admin')),
  `created_at` text NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` text NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX `profiles_email_unique` ON `profiles` (`email`);
CREATE TABLE `records` (
  `id` text PRIMARY KEY NOT NULL,
  `owner_id` text NOT NULL,
  `kind` text NOT NULL,
  `title` text NOT NULL,
  `detail` text NOT NULL,
  `status` text NOT NULL DEFAULT 'Draft',
  `price` integer,
  `created_at` text NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` text NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`owner_id`) REFERENCES `profiles`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE INDEX `records_owner_idx` ON `records` (`owner_id`);
CREATE INDEX `records_kind_idx` ON `records` (`kind`);
