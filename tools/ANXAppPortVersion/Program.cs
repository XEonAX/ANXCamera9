using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ANXAppPortVersion
{
    class Program
    {
        static void Main(string[] args)
        {
            var versionFilePath = args.FirstOrDefault(x => x.StartsWith("v="))?.Substring("v=".Length);
            var androidmanifestFilePath = args.FirstOrDefault(x => x.StartsWith("am="))?.Substring("am=".Length);
            var magiskmodulepropFilePath = args.FirstOrDefault(x => x.StartsWith("mm="))?.Substring("mm=".Length);
            bool incrementVersion = args.Contains("incrementversion=true");
            bool incrementVersionName = args.Contains("incrementversionname=true");
            if (!string.IsNullOrWhiteSpace(versionFilePath) && File.Exists(versionFilePath))
            {
                Console.WriteLine("VersionFile found at " + versionFilePath);
                Random rand = new Random();
                var adjectives = new Adjectives(rand);
                var animals = new Animals(rand);

                var versionFile = File.ReadAllLines(versionFilePath);
                var oldVersionStr = versionFile.FirstOrDefault(x => x.StartsWith("versioncode="))?.Substring("versioncode=".Length);
                var oldVersion = versionFile.FirstOrDefault(x => x.StartsWith("version="))?.Substring("version=".Length);
                var oldVersionCode = Convert.ToInt32(oldVersionStr);
                var newVersionCode = oldVersionCode;
                if (incrementVersion)
                {
                    newVersionCode++;
                }
                var newVersionName = oldVersion ?? adjectives.GetRand() +
                adjectives.GetRand() +
                animals.GetRand();
                if (incrementVersionName)
                {
                    newVersionName = adjectives.GetRand() +
                                       adjectives.GetRand() +
                                       animals.GetRand();
                }

                File.WriteAllLines(versionFilePath, new string[]
                {
                    "versioncode=" +newVersionCode,
                    "version=" + newVersionName
                });

                if (!string.IsNullOrWhiteSpace(androidmanifestFilePath) && File.Exists(androidmanifestFilePath))
                {
                    Console.WriteLine("AndroidManifest found at " + androidmanifestFilePath);
                    var oldAndroidManifest = File.ReadLines(androidmanifestFilePath);
                    var newAndroidManifest = new List<string>();
                    foreach (var line in oldAndroidManifest)
                    {
                        if (line.Contains(@"android:versionCode="""))
                        {
                            int vcPosStart = line.IndexOf(@"android:versionCode=""") + @"android:versionCode=""".Length;
                            int vcPosEnd = line.IndexOf(@"""", vcPosStart);
                            var newline = line.Replace(line.Substring(vcPosStart, vcPosEnd - vcPosStart), newVersionCode.ToString());
                            newAndroidManifest.Add(newline);
                        }
                        else if (line.Contains(@"android:versionName="""))
                        {
                            int vnPosStart = line.IndexOf(@"android:versionName=""") + @"android:versionName=""".Length;
                            int vnPosEnd = line.IndexOf(@"""", vnPosStart);
                            var newline = line.Replace(line.Substring(vnPosStart, vnPosEnd - vnPosStart), newVersionName.ToString());
                            newAndroidManifest.Add(newline);
                        }
                        else
                        {
                            newAndroidManifest.Add(line);
                        }
                    }
                    File.WriteAllLines(androidmanifestFilePath, newAndroidManifest);
                }
                if (!string.IsNullOrWhiteSpace(magiskmodulepropFilePath) && File.Exists(magiskmodulepropFilePath))
                {

                    Console.WriteLine("MagiskModuleProp found at " + magiskmodulepropFilePath);
                    var oldMagiskModuleProp = File.ReadLines(magiskmodulepropFilePath);
                    var newMagiskModuleProp = new List<string>();
                    foreach (var line in oldMagiskModuleProp)
                    {
                        if (line.StartsWith(@"version="))
                        {
                            newMagiskModuleProp.Add(@"version=" + newVersionName);
                        }
                        else if (line.Contains(@"versionCode="))
                        {
                            newMagiskModuleProp.Add(@"versionCode=" + newVersionCode);
                        }
                        else
                        {
                            newMagiskModuleProp.Add(line);
                        }
                    }

                    File.WriteAllText(magiskmodulepropFilePath, string.Join("\n", newMagiskModuleProp) + "\n");
                }
            }
        }
    }
}
